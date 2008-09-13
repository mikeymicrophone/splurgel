# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attach_site_path(obj)
    super(:class_name => obj.class.name.downcase, :id => obj.to_param)
  end
  
  def attachable_sites obj
    link_to_remote('attach site', :url => attach_site_path(obj), :update => 'uses', :method => :get) +
    '<div id="uses"></div>' + attached_sites(obj)
  end
  
  def attached_sites obj
    obj.websites.map { |ws| link_to_name ws }.join('<br>')
  end
  
  def message_link user
    link_to 'message', new_message_path(:message => {:recipient_id => user.id})
  end
  
  def follow_link obj
    if logged_in?
      if Following.find_by_follower_id_and_follower_type_and_target_id_and_target_type(current_user.id, 'User', obj.id, obj.class.name)
        'followed'
      else
        "<span id='follow'>" + link_to_remote('follow', :url => followings_path(:following => {:follower_type => 'User', :follower_id => current_user.id, :target_type => obj.class.name, :target_id => obj.id}), :update => 'follow') + "</span>"
      end
    end
  end
  
  def use_phone obj, phone
    phone = phone.is_a?(Phone) ? phone : Phone.find(phone)
    phone_id = phone.id
    link_to "uses #{phone.number}", phone_uses_path(:target_type => obj.class.name, :target_id => obj.id, :phone_id => phone_id)
  end
  
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
        text += ' to ' + ((obj.name rescue nil) || obj.class.name.downcase + ' ' + obj.id.to_s)
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
        if obj.name.blank? && obj.is_a?(Website)
          link_to obj.href, obj, :class => "name #{obj.class.name.downcase}"
        else
          link_to obj.name, obj, :class => "name #{obj.class.name.downcase}"
        end
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
      link_to list, listings_path(:listing => {obj_type => obj, :list_type => Listing.list_types[list]}), :method => :post unless current_user.listings.find(:first, :conditions => {:list_type => Listing.list_types[list], obj_type => obj})
    end.compact.join(' / ')
  end
  
  def list_links usr, except = nil
    (except == 'like' ? '' : link_to("#{usr.login}'s like list", like_list_path(usr), :class => 'list') + ' ') +
    (except == 'want' ? '' : link_to("#{usr.login}'s want list", want_list_path(usr), :class => 'list') + ' ') +
    (except == 'have' ? '' : link_to("#{usr.login}'s have list", have_list_path(usr), :class => 'list'))
  end
  
  def primary_image obj, size = '45x55'
    image_tag obj.primary_photo.public_filename, :alt => obj.name, :size => size if obj.primary_photo
  end
  
  def login_stuff
    if logged_in?
      profile_link + 
      link_to('log out?(no!)', logout_path, :class => 'login')
    else
      link_to('log in!', login_path, :class => 'login') + 
      link_to('sign up!', signup_path, :class => 'login')
    end
  end
  
  def tags_on obj
    obj.tags.map { |t| link_to_name t }
  end
  
  def comments_on obj, depth = 1
    content_tag(:div, obj.comments.map { |c| display_comment c, depth }.join, :id => dom_id(obj, 'comments_on'))
  end
  
  def display_comment comment, depth = 1, replies = true
    %Q{<div class="comment #{'r'*(depth-1)}">} +
    comment.body + link_to_name(comment.user) + '<br>' +
    link_to_remote('reply', :url => reply_to_comment_path(comment), :update => dom_id(comment, 'reply_to'), :method => :get, :loading => "insert_comment_holder(#{comment.id})") +
    content_tag(:div, {}, :id => dom_id(comment, 'reply_to')) + '</div>' + 
    (replies && comment.comments.not_empty? ? comments_on(comment, depth + 1) : '') + "\n"
  end
  
  def search_box_for model
    "<form action='/search/#{model.to_s.pluralize}' method='post'><input type='text' id='query' name='query'></form>"
  end
end
