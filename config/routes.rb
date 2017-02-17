Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/edit'

  resources :posts
  root "welcome#index"
  resources :categories
  resources :welcome
end
