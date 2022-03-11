Rails.application.routes.draw do
  get '/' => 'users#index'
  get '/users' => 'users#index'
  get '/posts' => 'posts#index'
  get '/users/:id' => 'users#show'
  get '/posts/:id/new_post' => 'posts#new_post' #new post page
  post '/posts/:id/create_post' => 'posts#create_post' #create post function
  get '/users/:user_id/posts/:id' => 'posts#show'
  post '/users/:user_id/posts/:id/create_comment' => 'posts#create_comment'
  get '/users/:user_id/posts/:id/create_comment' => 'posts#show'
  get '/users/:user_id/posts/' => 'posts#index'
  get '/users/:user_id/:user_id/posts/' => 'posts#index'
  get '/users/:user_id/posts/:id/new_comment' => 'posts#new_comment'
  get '/users/:user_id/posts/:id/new_like' => 'posts#new_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
