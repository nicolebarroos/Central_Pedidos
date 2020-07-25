Rails.application.routes.draw do
  resources :pedidos
  resources :lotes
  get '/by_canal/:canal_compra', to: 'pedidos#by_canal'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Don’t Repeat Yourself
