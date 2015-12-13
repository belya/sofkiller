Rails.application.routes.draw do

  resources :users, except: [:new, :create]

  resources :categories do
    resources :questions
  end

  resources :questions do
    resources :answers, except: [:index]
  end

  devise_for :users

  root 'categories#index'
  
end
