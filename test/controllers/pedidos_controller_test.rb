require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get pedidos_url, as: :json
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: { pedido: { canal_compra: @pedido.canal_compra, endereco: @pedido.endereco, itens: @pedido.itens, lote_id: @pedido.lote_id, nome_cliente: @pedido.nome_cliente, ref: @pedido.ref, status: @pedido.status, valor_total: @pedido.valor_total } }, as: :json
    end

    assert_response 201
  end

  test "should show pedido" do
    get pedido_url(@pedido), as: :json
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: { pedido: { canal_compra: @pedido.canal_compra, endereco: @pedido.endereco, itens: @pedido.itens, lote_id: @pedido.lote_id, nome_cliente: @pedido.nome_cliente, ref: @pedido.ref, status: @pedido.status, valor_total: @pedido.valor_total } }, as: :json
    assert_response 200
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete pedido_url(@pedido), as: :json
    end

    assert_response 204
  end
end
