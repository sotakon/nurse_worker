Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
    collection do
      post :confirm
    end
  end
  root 'rumors#index'
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
