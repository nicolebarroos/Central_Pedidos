Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pedidos
  resources :lotes
  #Rota para filtrar um canal de compra específico
  get '/by_canal/:canal_compra', to: 'pedidos#by_canal'
  #Rota para filtrar um status específico
  get '/by_status/:status', to: 'pedidos#by_status'

  get '/by_status_lotes/:status', to: 'lotes#by_status_lotes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Don’t Repeat Yourself
