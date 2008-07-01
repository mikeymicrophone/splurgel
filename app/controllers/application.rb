class ApplicationController < ActionController::Base
  helper :all
  include AuthenticatedSystem
  helper_method :logged_in?
  protect_from_forgery
  filter_parameter_logging :password

  def load_user_id_into_ar
    ActiveRecord::Base.instance_variable_set('@current_user', current_user) if logged_in?
  end
  
  before_filter :load_user_id_into_ar

end



class ActiveRecord::Base
  
  def current_user
    ActiveRecord::Base.instance_variable_get('@current_user')
  end
  
  def current_user_id
    current_user.id
  end
  
  def credit_creator
    self.user_id = current_user_id if respond_to?(:user_id) && user_id.blank?
  end
  
  def self.map_name_and_id(method = 'display_for_select')
    if respond_to?(:name)
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
