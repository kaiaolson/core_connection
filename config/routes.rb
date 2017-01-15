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
end
