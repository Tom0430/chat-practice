Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  get  '/auth/:provider/callback', to: 'users#google_login', as:'google_login'
  root 'tops#top'

  resources :users, only: [:create]
  resources :rooms, only: [:show, :create, :index, :destroy] do
    get :input_password, on: :member, as:'input_password'
    post :authenticate, on: :member, as:'authenticate'
  end
end
