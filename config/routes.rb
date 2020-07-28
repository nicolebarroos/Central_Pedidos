Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders
  resources :batches
  
  #Route to filter a specific purchase channel
  get '/by_channel/:purchase_channel', to: 'orders#by_channel'
  #Route to filter a specific status
  get '/by_status/:status', to: 'orders#by_status'
  #Filter certain batch status
  get '/by_status_batches/:status', to: 'batches#by_status_batches'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Don’t Repeat Yourself
