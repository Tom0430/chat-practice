Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  root "tops#top"

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing    .html
  resources :users, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
