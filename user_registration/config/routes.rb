Rails.application.routes.draw do
  root 'user#registration'
  get '/user' => 'user#registration'
  get '/user/confirmation' => 'user#confirmation'
end
