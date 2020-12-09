Rails.application.routes.draw do
  devise_for :admins
  # devise_for :users
  root 'questions#index' , as:'home'
  resources :questions do
    resources :answers
  end

  namespace :api do
    namespace :v1 do
      get 'games'=>'games#index'
      post 'signin' , controller: :auth , action: :authenticate
      post 'signup' , controller: :auth , action: :signup
      delete 'signout' , controller: :auth , action: :signout
      post 'score' => 'games#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
