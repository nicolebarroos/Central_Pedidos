Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace 'api' do
    namespace 'v1' do
      resources :orders
      resources :batches
    end
  end
  
  #Route to filter a specific purchase channel
  get '/by_channel/:purchase_channel', to: 'api/v1/orders#by_channel'
  #Route to filter a specific status
  get '/by_status/:status', to: 'api/v1/orders#by_status'
  #Filter certain batch status
  get '/by_status_batches/:status', to: 'api/v1/batches#by_status_batches'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Don’t Repeat Yourself
