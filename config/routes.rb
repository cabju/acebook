Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/user' => "posts#index", :as => :user_root
  #get 'sign_in'  => 'users#new' 
  
  resources :posts, :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
end
