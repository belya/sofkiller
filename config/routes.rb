Rails.application.routes.draw do

  devise_for :users
  
  resources :users, except: [:new, :create]

  resources :categories do
    resources :questions
  end

  resources :questions do
    resources :answers, except: [:index]
  end

  root 'categories#index'
  
end
