Rails.application.routes.draw do
    root 'cars#index'
    get 'cars/index'
    get 'cars/create' => 'cars#create'
    get 'cars/accelerate'
    get 'cars/brake'
    get 'cars/lights'
    get 'cars/parking_brake' => 'cars#parking_brake'
end
