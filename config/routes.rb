Rails.application.routes.draw do

  resources :wishes
  
  resources :books
  resources :session
 
  resources :users
  resources :loans
  get 'session/new'

  get 'session/create'

  get 'session/destroy'
  get "welcome/menuAdmin"
  get "/visitors/about"
  get "welcome" => "welcome#index", :as => "welcome"
  get "visitors" => "visitors#index", :as => "visitors"
  get "logout" => "session#destroy", :as => "logout"
  get "login" => "session#new", :as => "login"
  post "login" => "session#create"
  get "signup" => "users#new", :as => "signup"
  
  if :logged_in?
    root :to => "welcome#index"
  else
    root :to => "visitors#index"
  end
  
 
   #devise_for :users, :path_prefix => 'my'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=begin devise_scope :user do
   
     get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    authenticated :user do
      root :to => 'welcome#index'
    end
    unauthenticated :user do
      root :to => 'visitors#index', as: :unauthenticated_root
    end
  end
  
=end
  

  # You can have the root of your site routed with "root"
  #root :to => redirect('registrations/new')

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
