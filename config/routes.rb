Rails.application.routes.draw do
  devise_for :users
  root 'users#index' 

  get '/posts/:id/new_post' => 'posts#new_post' #new post page
  post '/posts/:id/create_post' => 'posts#create_post' #create post function
  post '/users/:user_id/posts/:id/create_comment' => 'comments#create_comment'
  get '/users/:user_id/posts/:id/create_comment' => 'posts#show'
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
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new_comment create destroy]
      resources :likes, only: %i[create]
    end
  end
end

