Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :users, except: [:new, :create]

  resources :categories do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: [:index]
    end
  end

  root 'categories#index'
  
end
