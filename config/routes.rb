Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
   get '/zhao' => 'home#zhao_index', :as => :zhao
   get '/chao' => 'home#chao_index', :as => :chao
   get '/vik' => 'home#vik_index', :as => :vik

   get    '/users/check_name' => "users#check_name"
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

  # chao_exchange_codes
   get  '/chao_exchange_codes/record'  => "chao_exchange_codes#record" ,:as => "record_chao_users"
   get  '/chao_exchange_codes/new'     => "chao_exchange_codes#new",    :as => "new_chao_exchange_code"
   get  '/chao_exchange_codes/exchange'=> "chao_exchange_codes#exchange",:as => "exchange"
   get  '/chao_exchange_codes/get_code'=> "chao_exchange_codes#get_code",:as => "user_get_code"
   get  '/chao_exchange_codes/:id'     => "chao_exchange_codes#show",   :as => "chao_exchange_code"  	
   get  '/chao_exchange_codes'         => "chao_exchange_codes#index",  :as => "chao_exchange_codes"
   get  '/chao_exchange_codes/:id/edit'=> "chao_exchange_codes#edit",   :as => "edit_chao_exchange_code"
   put  '/chao_exchange_codes/:id'     => "chao_exchange_codes#update", :as => "update_chao_exchange_code"
   delete '/chao_exchange_codes/:id'   => "chao_exchange_codes#destroy",   :as => "destroy_chao_exchange_code"
   post  '/chao_exchange_codes/recharge' => "chao_exchange_codes#recharge", :as => "chao_recharge"
   post '/chao_exchange_codes'         => "chao_exchange_codes#create", :as => "create_chao_exchange_code"

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
