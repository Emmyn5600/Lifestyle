Rails.application.routes.draw do
  root 'articles#index'


  resources :users, only: %i[new create]

  resources :articles, only: %i[new create show] do
    resources :comments
  end
  
  resources :categories, only: %i[new create show index]
  get '/vote/:article_id' => 'votes#add_vote', as: :add_vote

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
end
