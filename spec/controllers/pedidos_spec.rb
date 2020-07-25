require 'rails_helper'

describe PedidosController, type: :controller do
    it 'request index and return 200 OK' do
        request.accept = 'application/vnd.api+json'
        get :index
        expect(response).to have_http_status(200)
    end
end