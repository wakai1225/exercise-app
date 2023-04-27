Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  unauthenticated do
    as :user do
      root :to => 'devise/registrations#new'
    end
  end
  #root to: "exercises#index"

  
  resources :exercises
end
