Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  root "tops#top"
  get 'rooms', to: 'rooms#index', as: 'rooms'


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing    .html
  resources :users, only: [:create]
  resources :rooms, only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
