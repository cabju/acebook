Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users
  #root to: 'pages#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/user' => "posts#index", :as => :user_root
  #get 'sign_in'  => 'users#new' 
  post '/posts/:post_id/comments/:id/edit' => 'comments#update'
  get '/user/:id' => "users#show"
  patch '/posts/:post_id/comments/:id' => 'comments#update'
  post '/posts/:post_id/comments' => 'comments#create'
  resources :posts, :users, :comments


resources :posts do
  resources :comments
end

resources :posts do
  resources :likes
end

devise_scope :user do
  get 'login', to: 'devise/sessions#new'
end

resources :friendships

end
