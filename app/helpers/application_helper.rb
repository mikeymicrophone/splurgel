# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attach_image_link(obj = nil, img = nil)
    details = {:image_use => {}}
    text = 'paste'
    if img
      text += ' ' + img.name
      details[:image_use].merge!({:image_id => img.id})
    else
      text += ' an image'
    end
    
    if obj
      if obj.is_a?(String) || obj.is_a?(Class)
        text += ' to a ' + obj.to_s.downcase
        details[:image_use].merge!({:target_type => obj.to_s})
      elsif obj.kind_of?(ActiveRecord::Base)
        text += ' to ' + obj.name
        details[:image_use].merge!({:target_type => obj.class.name, :target_id => obj.id})
      end
    else
      text += ' to something'
    end
    debugger
    if details.length == 3
      link_to(text, images_path(details), :method => :post)
    else    
      link_to(text, new_image_use_path(details))
    end
  end
  
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
