Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }
  unauthenticated do
    as :user do
      root :to => 'devise/registrations#new'
    end
  end

  authenticated :user do
    root :to => 'users#show', as: :authenticated_root
  end
  
  resources :exercises
  resources :users
end
