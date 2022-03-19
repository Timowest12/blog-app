Rails.application.routes.draw do
  devise_for :users
  get '/' => 'users#index'
  get '/users' => 'users#index'
  get '/posts' => 'posts#index'
  get '/users/:id' => 'users#show'
  get '/posts/:id/new_post' => 'posts#new_post' #new post page
  post '/posts/:id/create_post' => 'posts#create_post' #create post function
  get '/users/:user_id/posts/:id' => 'posts#show'
  post '/users/:user_id/posts/:id/create_comment' => 'comments#create_comment'
  get '/users/:user_id/posts/:id/create_comment' => 'posts#show'
  get '/users/:user_id/posts/:id/delete' => 'posts#delete' #delete post
  get '/users/:user_id/posts/' => 'posts#index'
  get '/users/:user_id/:user_id/posts/' => 'posts#index'
  get '/api/users/:user_id/:user_id/posts/' => 'posts#index' #API posts index
  get '/users/:user_id/posts/:id/new_comment' => 'comments#new_comment' #new comment page
  get '/users/:user_id/posts/:id/comment/:comment_id/delete' => 'comments#delete' #delete comment
  get '/users/:user_id/posts/:id/new_like' => 'likes#new_like' #new like
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[show] do
        resources :posts, only: %i[index] do
          resources :comments, only: %i[create index]
        end
      end
    end
  end

  resources :users, only: [] do
    member do
      get 'apitoken'
    end
  end
end
