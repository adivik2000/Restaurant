ActionController::Routing::Routes.draw do |map|
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.resources :pages
  map.resources :elements
  map.resources :menus, :collection => { :download_pdf => :get }
  map.resources :dishes, :collection => { :update_individual => :put, :add_child => :post, :destroy_child => :post }
  map.resources :testimonials
  map.resources :offers
  map.resources :images  
  map.resources :upload
  map.resources :reservations
  map.resources :galleries, :has_many => :photos
  map.resources :people 
  map.resources :photos  
  map.resources :location
  map.resources :info
  map.resources :homepages
  map.resources :sites  
  map.resources :users  
  map.resources :wines
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.signin '/signin', :controller => 'sessions', :action => 'new'  
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  
  #order form
  map.resources :orders
  map.resources :items  
  map.resources :customers, :has_many => :orders
  map.resources :customer_sessions, :only => [:new, :create, :destroy]
  map.order '/order', :controller => 'checkout', :action => 'order'
  map.details '/details', :controller => 'checkout', :action => 'details'
  map.delivery '/delivery', :controller => 'checkout', :action => 'delivery'
  map.payment '/payment', :controller => 'checkout', :action => 'payment'
  map.confirm '/confirm', :controller => 'checkout', :action => 'confirm'  
  map.error '/error', :controller => 'checkout', :action => 'error'
  map.customer_signout '/customer_signout', :controller => 'customer_sessions', :action => 'destroy'
  
  
  map.root :controller => 'homepage', :action => 'index'
  map.signup '/signup', :controller => 'admin/users', :action => 'new'

  map.admin '/admin', :controller => 'admin', :action => 'index'    
  map.namespace :admin do |admin|
    #this stuff is all not needed because none of these are restful
   # admin.resources :pages
    #admin.resources :menus, :has_many => :dishes, :has_many => :wines
    #admin.resources :dishes
    #admin.resources :wines    
    #admin.resources :galleries, :has_many => :photos
    #admin.resources :photos    
    #admin.resources :people   
    #admin.resources :sites    
    #admin.resources :images
    #admin.resources :pages
    #admin.resources :galleries
    #admin.resources :photos        
    #admin.resources :reservations
    #admin.resources :location
    #admin.resources :users   
    #admin.resources :info     
  end
  
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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
