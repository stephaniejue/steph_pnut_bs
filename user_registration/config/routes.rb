Rails.application.routes.draw do
  root 'users#registration'
  post '/users/registration' => 'users#registration'
  get '/users/confirmation' => 'users#confirmation'
  get '/users/login' => 'users#login'
  get '/users/profile' => 'users#profile'
  get '/users/logout' => 'users#logout'
end
