class ApplicationController < ActionController::Base
  helper :all
  include AuthenticatedSystem
  helper_method :logged_in?, :current_user?, :searchable_models
  protect_from_forgery
  filter_parameter_logging :password
  
  def search
    @results = params[:model].singularize.capitalize.constantize.send(:find_with_ferret, params[:query])
    render :partial => 'shared/results'
  end
  
  def searchable_models
    %w!addresses brands cities comments groups images locations messages networks products stores tags users websites!
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
    elsif respond_to?(:name)
      all.map { |r| [r.name, r.id] }
    else
      all.map { |r| [r.send(method), r.id] }
    end
  end
    
  before_create :credit_creator
  
end

class Array
  def map_name_and_id(method = 'display_for_select')
    if respond_to?(:name)
      map { |e| [e.name, e.id] }
    else
      map { |e| [e.send(method), e.id] }
    end
  end
  
  def not_blank?
    !blank?
  end
  alias :not_empty? :not_blank?
end
