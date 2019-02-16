Rails.application.routes.draw do
  root 'sensors#index'

  resources :sensors, only: [:index]
  post 'sensors/:serial_id', to: 'sensors#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
