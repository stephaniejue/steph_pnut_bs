Rails.application.routes.draw do
  root 'cars#index'

  get '/' => 'cars#index'
  get '/cars' => 'cars#index'
  get '/cars/status' => 'cars#status'
  get '/cars/accelerate' => 'cars#accelerate'
  get '/cars/brake' => 'cars#brake'
  get '/cars/lights' => 'cars#lights'
  get '/cars/parking_brake' => 'cars#parking_brake'

end
