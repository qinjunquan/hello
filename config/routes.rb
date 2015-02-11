Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
   get '/zhao' => 'home#zhao_index', :as => :zhao
   get '/chao' => 'home#chao_index', :as => :chao
   get '/vik' => 'home#vik_index', :as => :vik

   get    '/users'          => "users#index",   :as => "users"
   post   '/users'          => "users#create",  :as => "create_user"
   get    '/users/new'      => "users#new",     :as => "new_user"
   get    '/users/:id'      => "users#show",    :as => "user"
   put    '/users/:id'      => "users#update",  :as => "update_user"
   delete '/users/:id' => "users#destroy", :as => "delete_user"
   get    '/users/:id/edit' => "users#edit",    :as => "edit_user"

  # chao_users
   get  '/chao_users/new'      => "chao_users#new",    :as => "new_chao_user"
   post '/chao_users'          => "chao_users#create", :as => "create_chao_user"
   get  '/chao_users/:id'      => "chao_users#show",   :as => "chao_user"
   get  '/chao_users'          => "chao_users#index",  :as => "chao_users"
   get  '/chao_users/:id/edit' => "chao_users#edit" ,  :as => "edit_chao_user"
   put  '/chao_users/:id'      => "chao_users#update", :as => "update_chao_user"
   delete '/chao_users/:id'    => "chao_users#destroy",:as => "destroy_chao_user"

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
