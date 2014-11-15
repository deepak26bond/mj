Rails.application.routes.draw do
  get 'collections/collection'

  get 'users/admin_login'
 get "users/logout"
 post "users/admin_auth"
 
 get "mjweller/about"
 get "mjweller/home"
  get "mjweller/collection"
  get "mjweller/collection_new"
  get "mjweller/contact"
  post '/mjweller/mail_send'
  get "mjweller/detail"
  get "mjweller/item_detail"
  post "mjweller/add_detail"
  get "mjweller/price"
  get "mjweller/price_update"
  post "mjweller/price_update_db"
  get "mjweller/price_all"
  post "mjweller/add_price"
  get "mjweller/total_collection"
  get "mjweller/update"
   post "mjweller/add_update"
  get "mjweller/delete"
  get "mjweller/add_subcategory"
  post "mjweller/add_subcat_db"
  get "mjweller/search_weight"
  get "mjweller/search_id"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'mjweller#home'

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
