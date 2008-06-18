require( File.join( File.dirname(__FILE__), "../authorized_generator_helpers" ))

class AuthorizedGenerator < Rails::Generator::NamedBase
  default_options :library_only => false,
                  :skip_migration => false
  
  include AuthorizedGeneratorHelpers
  
  attr_accessor :roles_model_name, 
                :roles_table_name, 
                :users_table_name, 
                :users_model_name,
                :next_user_id
      
  def initialize(runtime_args, runtime_options = {})
    super
    @roles_model_name = (runtime_args[0] || "Role").classify
    @users_model_name = (runtime_args[1] || "User").classify
    
    @roles_table_name = @roles_model_name.tableize
    @users_table_name = @users_model_name.tableize
    
    puts "Generating authorization for #{@users_model_name}"
  end
  
  def manifest
    record do |m|
      unless options[:library_only]
        modify_or_add_user_fixtures(m)
        add_roles_and_join_table_fixtures(m)
      
        add_method_to_user_model(m)
      
        add_role_model(m)
        add_dependencies_to_application_rb
        add_migration(m) unless options[:skip_migration]
      end
      
      add_authorized_system(m)

    end
  end
  
  def add_role_model(m)
    # add the Role model
    m.template 'role_model.rb.erb', roles_model_filename
  end
  
  def add_method_to_user_model(m)
    content_for_insertion = render_template("_has_role.erb")
    # modify the User model unless it's already got AuthorizedSystem code in there
    if insert_content_after(users_model_filename,
                      Regexp.new("class +#{users_model_name}"),
                      content_for_insertion,
                      :unless => lambda { |content| content.include? "def has_role?"; }
                      )
      puts "Added the following to the top of #{users_model_filename}:\n#{content_for_insertion}\n\n"
    else
      puts "Not modifying #{users_model_filename} because it appears that the funtion has_role? already exists.\n\n"
    end
  end
    
  def modify_or_add_user_fixtures(m)
    if (File.exists?(users_fixture_filename))
      users_fixtures_content = File.read users_fixture_filename
      users_fixtures = YAML.load(users_fixtures_content)
      
      begin
        throw "Can't understand whatever is in #{users_fixture_filename}" unless Hash===users_fixtures
        
        unless users_fixtures.has_key?("admin")
          @next_user_id = (users_fixtures.collect{ |k, params| params["id"].to_i}.max||0) + 1
          output = users_fixtures_content + "\n" + render_template("users_admin_fixture_with_roles.yml")
          
          # prevent generator from truncating the whole file if something goes wrong.
          if output.length > users_fixtures_content.length
            File.open(users_fixture_filename, "w") {|f| f.write(output) }
          end
        else
          @next_user_id = users_fixtures["admin"]["id"].to_i
        end
      rescue
        skip_fixtures = true
      end
    else
      # users.yml doesn't exist.  Generate it from scratch
      @next_user_id = 1
      
      m.template 'users_admin_fixture_with_roles.yml',
        File.join('test/fixtures', "#{users_table_name}.yml")
    end

  end
  
  def add_migration(m)
    m.migration_template 'migration.rb.erb', 'db/migrate', :assigns => {
      :migration_name => "Create#{roles_model_name.pluralize.gsub(/::/, '')}"
    }, :migration_file_name => "create_#{roles_table_name}"
  end
  
  def add_roles_and_join_table_fixtures(m)
    m.template 'roles_users.yml',
              File.join('test/fixtures', "#{habtm_name}.yml")
    m.template 'roles.yml',
              File.join('test/fixtures', "#{roles_table_name}.yml")
  end
  
  def add_authorized_system(m)
    m.template 'authorized_system.rb.erb',
          File.join('lib', "authorized_system.rb")
  end

  def add_dependencies_to_application_rb
    app_filename = "#{RAILS_ROOT}/app/controllers/application.rb"

    restful_authentication_content = <<EOF
  # AuthenticatedSystem must be included for AuthorizedSystem and is provided by restful_authentication
  include AuthenticatedSystem
EOF

    restful_authorization_content = <<EOF
  include AuthorizedSystem
EOF

    insert_content_after(
      app_filename, 
      /class +ApplicationController/, 
      restful_authentication_content,
      :unless => lambda {|content| /include +AuthenticatedSystem/.match(content) }
    ) && puts("Added ApplicationController include to #{app_filename}")

    insert_content_after(
      app_filename, 
      /include +AuthenticatedSystem/, 
      restful_authorization_content,
      :unless => lambda {|content| /include +AuthorizedSystem/.match(content) }
    ) && puts("Addded AuthorizedSystem include to #{app_filename}")

  end

  def users_model_filename;  "app/models/#{users_model_name.underscore}.rb"; end;    
  def users_name;  "#{users_model_name.downcase}"; end;  
  def habtm_name;       [roles_table_name, users_table_name].sort * "_"; end
  def roles_foreign_key; roles_table_name.singularize.foreign_key; end
  def roles_model_filename;  "app/models/#{roles_model_name.underscore}.rb"; end;
  def users_foreign_key; users_table_name.singularize.foreign_key; end
  def users_fixture_filename;   "test/fixtures/#{users_table_name}.yml"; end;
  
  protected
    def banner
      "Usage: #{$0} authorized RoleModelName [TargetUserModelName]"
    end


    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--skip-migration", 
             "Don't generate a migration file for this model") { |v| options[:skip_migration] = v }
      opt.on("--library-only", 
             "Only regenerates the library file") { |v| options[:library_only] = true }
    end
end