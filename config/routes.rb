Rails.application.routes.draw do
  root 'cars#index'
  # get '/' => 'cars#index'

  get 'cars/new' => 'cars#new' , as: 'new_car'

  post 'cars' => 'cars#create'

end
