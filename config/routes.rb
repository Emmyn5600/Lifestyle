Rails.application.routes.draw do
  get 'session/new'
  get '/login' => 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
