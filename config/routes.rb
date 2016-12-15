Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  patch 'posts/update'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/delete'
  get 'posts/update'
end
