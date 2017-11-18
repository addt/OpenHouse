Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  # get 'same_director/:title' => 'movies#search', as: :same_director
  
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
  
  
  get '/', to: 'main#show', as: 'root'
  get '/search', to: 'main#search', as: 'search'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'sessions/new'
  get '/users/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/show', to: 'users#show', as: 'show_user'
  get '/users/new_billing', to: 'users#new_billing', as: 'new_user_billing'
  get '/users/new_host', to: 'users#new_host', as: 'new_user_host'
  patch '/users/new_billing/:id', to: 'users#update_billing', as: 'update_user_billing'
  patch '/users/new_host/:id', to: 'users#update_host', as: 'update_user_host'
  get '/us', to: 'main#us', as: 'us'
  get '/about', to: 'main#about', as: 'about'
  resources :users, :except => [:edit]
end
