Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'welcome/index'

  get 'welcome/edit'

  resources :posts do
    resources :comments
  end
  root "welcome#index"
  resources :categories
  resources :welcome
end
