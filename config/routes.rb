Rails.application.routes.draw do
  get 'oauth/index'
  resources :labels
  devise_for :corporations, controllers: {
    sessions:      'corporations/sessions',
    passwords:     'corporations/passwords',
    registrations: 'corporations/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :jobs do
    collection do
      post :confirm
    end
  end
  # root to: 'oauth#index'
  root 'tops#index'
  post '/rumors/guest_sign_in', to: 'rumors#new_guest'
  post '/jobs/guest_sign_in', to: 'jobs#new_guest'
  resources :favorites
  resources :corporations_favorites
  resources :users
  resources :corporations
  resources :tops
  resources :admins
  resources :rumors do
    resources :comments
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
