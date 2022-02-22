Rails.application.routes.draw do
  get '/' => 'users#index'
  get '/users' => 'users#index'
  get '/posts' => 'posts#index'
  get '/users/:id' => 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
