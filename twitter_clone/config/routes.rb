Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do 
    resources :users, only: [:create, :new]
    resources :tweets, only: [:create, :index, :show, :edit, :destroy, :update]
    resources :likes, only: [:create, :destroy]
    resource :session, only: [:create, :destroy, :new]
  end

  root to: "static_pages#root"
end
