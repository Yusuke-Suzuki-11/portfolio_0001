Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/following/:id' => 'users#following'
  get '/followers/:id' => 'users#followers'


  get '/tops/home' => "tops#home"
  resources :relationships, only: %i(create destroy)
  resources :chat, only: %i(create show)
  resources :posts, only: %i(index new create show destroy) do
    resources :movies, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
