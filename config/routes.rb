Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  unauthenticated do
    as :user do
      root :to => 'devise/registrations#new'
    end
  end


  #root to: "exercises#index"

  
  resources :exercises
  resources :users, only: :show
end
