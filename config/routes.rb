Rails.application.routes.draw do
  devise_for :corporations, controllers: {
    sessions:      'corporations/sessions',
    passwords:     'corporations/passwords',
    registrations: 'corporations/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :jobs do
    collection do
      post :confirm
    end
  end
  root 'tops#index'
  post '/rumors/guest_sign_in', to: 'rumors#new_guest'
  post '/jobs/guest_sign_in', to: 'jobs#new_guest'
  resources :favorites
  resources :corporations_favorites
  resources :users
  resources :corporations
  resources :tops
  resources :rumors do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
