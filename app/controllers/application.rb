class ApplicationController < ActionController::Base
  helper :all
  include AuthenticatedSystem
  helper_method :logged_in?, :current_user?, :searchable_models
  protect_from_forgery
  filter_parameter_logging :password
  before_filter :login_required
  
  def search
    @results = params[:model].singularize.capitalize.constantize.send(:search, params[:query])
    render :partial => 'shared/results'
  end
  
  def searchable_models
    %w!addresses brands cities comments groups images locations memberships messages networks network_memberships products stores styles tags users websites!
  end

  def load_user_id_into_ar
    ActiveRecord::Base.instance_variable_set('@current_user', current_user) if logged_in?
  end
  
  def current_user_id
    @current_user_id ||= (current_user ? current_user.id : nil)
  end
  
  def current_user? user
    current_user_id == if user.is_a? Integer
      user
    elsif user.is_a? User
      user.id
    elsif user.kind_of? ActiveRecord::Base
      if user.respond_to?(:user)
        user.user_id
      else
        'miningus' # won't match any user, I thought false might match an unlogged in user although I believe it's :false
        # put custom behavior for certain models here
      end
    end
  end
  
  before_filter :load_user_id_into_ar

end



class ActiveRecord::Base
  
  def self.scope_down controller, parameters, *associated_ids
    set = nil
    associated_ids.each do |c|
      if set.nil? && parameters["#{c}_id"]
        set = controller.instance_variable_set("@#{c}", c.capitalize.constantize.send(:find, parameters["#{c}_id"])).send(self.name.underscore.pluralize)
      end
    end
    return set || all
  end
  
  def make_known body, targets = nil, short_version = nil
    if targets && targets.is_a?(Array) && targets.length > 1
      primary_target = targets.shift
      secondary_targets = targets.map { |t| [t.class.name, t.id] }
    elsif targets && targets.is_a?(Array)
      primary_target = targets.first
    else
      primary_target = targets
    end
    Notice.create(:followed => self, :body => body, :target => primary_target, :short_version => short_version, :secondary_targets => secondary_targets)
  end
  
  def uses_phone phone
    case phone
    when Phone
      phone.is_used_by self
    when PhoneUse
      phone.phone.is_used_by self
    when String
      return if phone.blank?
      Phone.find_or_create_by_number(phone).is_used_by self
    end
  end
  
  def uses_site site
    case site
    when Website
      site.is_used_by self
    when WebsiteUse
      site.website.is_used_by self
    when String
      return if site.blank?
      Website.find_or_create_by_href(site).is_used_by self
    end
  end
  
  def uses_image image
    case image
    when Image
      image.is_used_by self
    when ImageUse
      image.image.is_used_by self
    end
  end
  
  def primary_photo
    if respond_to?(:primary_photos) && primary_photos && primary_photos.not_blank?
      Image.find( primary_photos[ rand( primary_photos.length ) ] )
    elsif respond_to?(:images) && images && images.not_blank?
      images[rand(images.length)]
    else
      nil
    end
  end
  
  def add_primary_photo img
    self.primary_photos ||= []
    self.primary_photos.push(img.kind_of?(ActiveRecord::Base) ? img.id : img) && save if img && respond_to?(:primary_photos)
  end
  
  def current_user
    ActiveRecord::Base.instance_variable_get('@current_user')
  end
  
  def current_user_id
    current_user.id if current_user
  end
  
  def credit_creator
    self.user_id = current_user_id if respond_to?(:user_id) && user_id.blank?
  end
  
  def self.map_name_and_id(method = 'display_for_select')
    if method != 'display_for_select'
      all.map { |r| [r.send(method), r.id] }
    elsif first.respond_to?(:name)
      all.map { |r| [r.name, r.id] }
    else
      all.map { |r| [r.send(method), r.id] }
    end
  end
    
  before_create :credit_creator
  
  def to_param
    "#{id}#{'_' + name.for_url if name}"
  end
  
end

class Array
  def map_name_and_id(method = 'display_for_select')
    if method != 'display_for_select'
      map { |e| [e.send(method), e.id] }
    elsif first.respond_to?(:name)
      map { |e| [e.name, e.id] }
    else
      map { |e| [e.send(method), e.id] }
    end
  end
  
  def not_blank?
    !blank?
  end
  alias :not_empty? :not_blank?
  alias :is_not_blank? :not_blank?
end

class String
  def for_url
    safe = dup
    unsafe_chars = /[\#\/\$\&\+\,\.\:\;\=\?\@\<\>\%\{\}\|\\\^\~\[\]\`\'\"]/
    safe.gsub! unsafe_chars, '-'
    safe.gsub! ' ', '_'
    safe.gsub! '--', '-' while self =~ /--/
    safe
  end
end

class NilClass
  def not_blank?
    false
  end
  
  alias :is_not_blank? :not_blank?
end