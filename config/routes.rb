Rails.application.routes.draw do

  devise_for :users
  
  resources :users, except: [:new, :create]

  resources :categories do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: [:index]
    end
  end

  root 'categories#index'
  
end
