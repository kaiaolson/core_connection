Rails.application.routes.draw do
  get 'password_resets/new'

  #root # set this to a home page for employers to see on first arrival
  get "/home" => "welcome#index"
  root "welcome#index"

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

  resources :users
  resources :contacts, only: [:new, :create, :show]
  resources :categories

  resources :profiles do
    resources :projects
    resources :skills
    resources :educations
    resources :experiences
    resources :contacts, only: [:new, :create, :show]
  end

  resources :password_resets

  resources :contacts, only: [:new, :create]

  get "users/:id/edit_password" => "users#edit_password", as: :edit_password
  patch "users/:id/update_password" => "users#update_password"


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
