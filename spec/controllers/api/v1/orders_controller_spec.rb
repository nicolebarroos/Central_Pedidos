require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  
    it 'request index and return 200 OK' do
      request.accept = 'application/vnd.api+json'
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'GET /api/v1/orders/:id' do
        order = Order.first
        request.accept = 'application/vnd.api+json'
        get :show, params: { id: order.id }
        #response_body = JSON.parse(response.body)

        expect(response).to have_http_status(200)
      end

    #let(:valid_credentials) do 
    #    { 
    #        ref: "123", 
    #        purchase_channel: "br"
    #    } 
    #end

    #it "creates a Order" do
    #    headers = { "ACCEPT" => "application/json" }
    #    post '/api/v1/orders', params: valid_credentials
    
    #    expect(response.content_type).to eq("application/json")
    #    expect(response).to have_http_status(:created)
    #end
end

