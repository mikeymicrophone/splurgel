# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attach_image_link(obj = nil, img = nil)
    details = {:image_use => {}}
    text = 'paste'
    if img
      text += ' ' + (img.name || 'image ' + img.id.to_s)
      details[:image_use].merge!({:image_id => img.id})
    else
      text += ' an image'
    end
    
    if obj && !obj.nil?
      if obj.is_a?(String) || obj.is_a?(Class)
        text += ' to a ' + obj.to_s.downcase
        details[:image_use].merge!({:target_type => obj.to_s})
      elsif obj.kind_of?(ActiveRecord::Base)
        text += ' to ' + (obj.name || obj.class.name.downcase + ' ' + obj.id.to_s)
        details[:image_use].merge!({:target_type => obj.class.name, :target_id => obj.id})
      end
    else
      text += ' to something'
    end
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
  
  def lists obj
    obj_type = {Product => :product_id, Brand => :brand_id, Store => :store_id}[obj.class]
    %w[ like have want ].map do |list|
      link_to list, listings_path(:listing => {obj_type => obj, :list_type => Listing.list_types[list]}), :method => :post
    end.join(' / ')
  end
  
  def list_links usr
    link_to("#{usr.login}'s like list", like_list_path(usr), :class => 'list') +
    link_to("#{usr.login}'s want list", want_list_path(usr), :class => 'list') +
    link_to("#{usr.login}'s have list", have_list_path(usr), :class => 'list')
  end
  
  def primary_image obj, size = '45x55'
    image_tag obj.primary_photo.public_filename, :alt => obj.name, :size => size if obj.primary_photo
  end
  
  def login_stuff
    if logged_in?
      profile_link + 
      link_to('log out', logout_path)
    else
      link_to('log in', login_path) + 
      link_to('sign up', signup_path)
    end
  end
  
  def tags_on obj
    obj.tags.map { |t| link_to_name t }
  end  
end
