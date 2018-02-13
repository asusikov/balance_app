Rails.application.routes.draw do
  # namespace :user do
  #   get 'operations/index'
  # end
  #
  # namespace :user do
  #   get 'operations/create'
  # end
  #
  # namespace :user do
  #   get 'operations/update'
  # end
  #
  # namespace :user do
  #   get 'operations/destroy'
  # end
  #
  # get 'user/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :operations, module: :users, only: [:index, :create, :destroy]
  end
end
