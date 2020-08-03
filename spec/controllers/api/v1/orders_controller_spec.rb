require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  let(:order_params) do 
    {
      ref: "BR102030",
      purchase_channel: " site BR",
      cliente_name: "Rogerio Lima",
      delivery_service: "SEDEX",
      address: " Rua Padre Valdevino, 2475 - Aldeota, Fortaleza - CE, 60135-041",
      total_value: 123.0,
      line_items: "Case-my-best-friend, modelo: iPhone X, tipo de caso: Rose Leather",
      status: "Pronto",
      batch_id: 1
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
    expect(response.body).to include("BR102030")
  end

  it "PATCH /api/v1/orders/:id" do
    patch :update, :params => { :id => @order.id, :order => order_params.merge!(purchase_channel: "Site Br") }

    expect(response.body).to include("Site Br")
    expect(response.body).not_to include("web")
  end

  it "DELETE /api/v1/orders/:id" do
    delete :destroy, :params => {:id => @order.id}

    expect(response).to have_http_status(204)
  end
  
end

