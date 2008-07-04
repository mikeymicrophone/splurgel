# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def profile_link
    link_to current_user.login, current_user, :id => 'profile'
  end
  
  def link_to_name obj, method = nil
    return '' if obj.nil?
    unless method
      if obj.respond_to?(:name)
        link_to obj.name, obj, :class => "name #{obj.class.name.downcase}"
      else
        link_to 'here', obj, :class => obj.class.name.downcase
      end
    else
      link_to obj.send(method), obj, :class => obj.class.name.downcase
    end
  end
  
  def link_to_resource obj
    link_to obj.class.name.downcase.pluralize, send(obj.class.name.downcase.pluralize + '_path')
  end
  
  def link_to_backup
    link_to_function 'backitup', 'history.go(-1)'
  end
end
