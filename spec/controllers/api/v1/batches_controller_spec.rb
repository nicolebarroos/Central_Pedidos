require 'rails_helper'

describe Api::V1::BatchesController, type: :controller do
  
    it 'request index and return 200 OK' do
      request.accept = 'application/vnd.api+json'
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'GET /api/v1/batches/:id' do
        batch = Batch.first
        request.accept = 'application/vnd.api+json'
        get :show, params: { id: batch.id }
        #response_body = JSON.parse(response.body)

        expect(response).to have_http_status(200)
      end
      
      let(:batch_params) do 
        { 
          ref: "123", 
          purchase_channel: "br",
          status: "finalizado"
        } 
    end

    it "creates a Batch" do
      #headers = { "ACCEPT" => "application/json" }
      post :create, :params => { :batch => batch_params }
    
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end

end

