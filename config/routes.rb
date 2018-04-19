Rails.application.routes.draw do
  
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  resources :users
  post 'verifications' => 'verifications#create'
  patch 'verifications' => 'verifications#verify'
  namespace :api do
  	namespace :v1 do
  		resources :posts
  		resources :comments
  	end
  end
end
