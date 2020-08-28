require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  let(:order_params) do 
    {
      id: 13,
      ref: "BR102030",
      purchase_channel: "Loja Iguatemi",
      cliente_name: "Rogerio Lima",
      address: "Rua Padre Valdevino, 2475 - Aldeota, Fortaleza - CE, 60135-041",
      total_value: 123.3,
      line_items: "Case-my-best-friend, model: iPhone X, case type: Rose Leather",
      status: "Produção",
      batch_id: 1,
      delivery_service: "Correios"
  }
  end

  before(:each) do
    @order = Order.create(order_params)
  end
  
  it 'request index and return 200 OK' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'GET /api/v1/orders/:id' do
    get :show, params: { id: @order.id }

    expect(response).to have_http_status(200)
  end

  it "creates a Order" do
    post :create, :params => { :order => order_params }

    expect(response).to have_http_status(:created)
    expect(response.body).to include("ref")
  end

  it "PATCH /api/v1/orders/:id" do
    patch :update, :params => { :id => @order.id, :order => order_params.merge!(purchase_channel: "Loja Iguatemi") }

    expect(response.body).to include("Loja Iguatemi")
    expect(response.body).not_to include("web")
  end

  it "DELETE /api/v1/orders/:id" do
    delete :destroy, :params => {:id => @order.id}

    expect(response).to have_http_status(204)
  end
  
end

