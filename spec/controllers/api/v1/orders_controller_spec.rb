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
      
    let(:order_params) do 
        { 
          ref: "123", 
          purchase_channel: "br",
          cliente_name: "Nicole", 
          address: "Leão veloso", 
          total_value: "250.00", 
          line_items: "capinha", 
          status: "finalizado", 
          batch_id: "1", 
          delivery_service: "sedex"
        } 
    end

    it "creates a Order" do
      #headers = { "ACCEPT" => "application/json" }
      post :create, :params => { :order => order_params }
    
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end

end

