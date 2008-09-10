ActionController::Routing::Routes.draw do |map|
  map.resources :delivered_notices

  map.resources :notices

  map.resources :authorizations

  map.resources :phone_uses

  map.resources :phones

  map.like_list '/users/:id/like/list', :controller => 'listings', :action => 'show_list', :list_type => '1'
  map.want_list '/users/:id/want/list', :controller => 'listings', :action => 'show_list', :list_type => '2'
  map.have_list '/users/:id/have/list', :controller => 'listings', :action => 'show_list', :list_type => '3'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.attach_site '/use/:class_name/:id', :controller => 'website_uses', :action => 'use'
  
  map.resources :address_uses

  map.resources :network_memberships

  map.resources :networks

  map.resources :credit_cards

  map.resources :addresses

  map.resources :purchases

  map.resources :messages

  map.resources :comments, :member => {:reply_to => :get}

  map.resources :website_uses, :collection => {:use => :get}

  map.resources :websites

  map.resources :image_uses, :member => {:prioritize => :post}

  map.resources :images

  map.resources :followings

  map.resources :taggings

  map.resources :tags do |tag|
    tag.resources :taggings
  end

  map.resources :memberships

  map.resources :groups do |group|
    group.resources :memberships
  end

  map.resources :listings, :member => {:publicize => :post, :privatize => :post}

  map.resources :schedules do |schedule|
    schedule.resources :locations
  end

  map.resources :prices

  map.resources :offerings do |offering|
    offering.resources :prices
  end

  map.resources :products do |product|
    product.resources :offerings
  end

  map.resources :brands

  map.resources :locations do |location|
    location.resources :offerings
  end

  map.resources :cities

  map.resources :states

  map.resources :stores do |store|
    store.resources :locations
  end
    
  map.resources :users do |user|
    user.resources :followings
  end

  map.resource :session
  
  map.connect 'search/:model', :controller => 'application', :action => 'search', :method => :post
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "users", :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
