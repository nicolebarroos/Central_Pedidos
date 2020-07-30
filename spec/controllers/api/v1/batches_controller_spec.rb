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

end

