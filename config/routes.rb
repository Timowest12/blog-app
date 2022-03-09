Rails.application.routes.draw do
  get '/' => 'users#index'
  get '/users' => 'users#index'
  get '/posts' => 'posts#index'
  get '/users/:id' => 'users#show'
  get '/users/:user_id/posts/:id' => 'posts#show'
  get '/users/:user_id/posts/' => 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
