Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/lock_unlock_account'
  post 'admin/lock_unlock_account' => 'admin#lock'

  get 'admin/new' => 'admin#new'
  post 'admin/new' => 'admin#create'

  root 'home#index'

  get 'posts/39578309' => 'posts#new'
  post 'posts/28593865' => 'posts#create'
  get 'posts/56740986' => 'posts#edit'
  post 'posts/12345678' => 'posts#change'
  get 'posts/87654321' => 'posts#share'
  get 'posts/poljuicv' => 'posts#favorite'
  get 'posts/pljuiwsf' => 'posts#report'
  get 'posts/vbukinb' => 'posts#delete'
  get 'posts/acuepogh' => 'posts#show'

  get 'friendships/asdfasdf' => 'friendships#create'
  get 'friendships/zxcvzxcv' => 'friendships#destroy'
  get 'friendships/qwerqewr' => 'friendships#show'
  get 'friendships/uiopuiop' => 'friendships#index'
  get 'friendships/hjklhjkl' => 'friendships#approve'
  get 'friendships/tytytyty' => 'friendships#disapprove'
  get 'friendships/ervopmhg' => 'friendships#followers'
  get 'friendships/aaaaaaaa' => 'friendships#followed_by'


  devise_for :users, :controllers => { registrations: 'registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
