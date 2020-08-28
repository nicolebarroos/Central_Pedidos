require 'rails_helper'

describe Api::V1::BatchesController, type: :controller do
  let(:batch_params) do 
    {
      ref: '201803-54', 
      purchase_channel: 'Loja Iguatemi', 
      status: 'Produção',
      delivery_service: 'Correios'
    }
  end

  before(:each) do
    @batch = Batch.create(batch_params)
  end
  
  it 'request index and return 200 OK' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'GET /api/v1/batches/:id' do
    get :show, params: { id: @batch.id }

    expect(response).to have_http_status(200)
  end

  it "creates a Batch" do
    post :create, :params => { :batch => batch_params }

    expect(response).to have_http_status(:created)
    expect(response.body).to include("ref")
  end

  it "PATCH /api/v1/batches/:id" do
    patch :update, :params => { :id => @batch.id, :batch => batch_params.merge!(purchase_channel: "Loja Iguatemi") }

    expect(response.body).to include("Loja Iguatemi")
    expect(response.body).not_to include("web")
  end

  it "DELETE /api/v1/batches/:id" do
    delete :destroy, :params => {:id => @batch.id}

    expect(response).to have_http_status(204)
  end
  
end

