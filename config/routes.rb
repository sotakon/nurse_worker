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
  get "users/show" => "users#show"
  resources :jobs do
    collection do
      post :confirm
    end
  end
  root 'rumors#index'
  resources :favorites
  resources :rumors do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
