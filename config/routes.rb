TadashiShojiWebsite::Application.routes.draw do
  

  resources :retailers

  resources :countries do |country|
    resources :states    
  end

  resources :colors

  resources :sizes

  get "sessions/new"

  resources :users

  resources :collections do |collections|
    resources :styles do |styles| 
      resources :product_images 
    end  
  end
  
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match 'catalog/grid/:url' => "catalog#grid"
  match 'catalog/slide/:url' => "catalog#slide"
  match 'catalog/video/:url' => "catalog#video"
  get 'catalog/search' => "catalog#search" 

  match '/', :to => 'pages#home'
  
  #collections url 
  match '/ss2013runway', :to => 'catalog#grid#3'
  
  root :to => 'pages#home'
  
  get "pages/home"

  get "pages/collections"
  
  get "pages/privacy"

  get "pages/contact"
  
  get "pages/newsletter"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
