class ApplicationController < ActionController::Base
  helper :all
  include AuthenticatedSystem
  helper_method :logged_in?, :current_user?
  protect_from_forgery
  filter_parameter_logging :password

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
end
