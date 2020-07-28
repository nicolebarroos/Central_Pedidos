class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  has_scope :by_channel, :by_status

  #Function to pass the parameter purchase_channel, which will be used in the route
  def by_channel
    @orders = Order.by_channel(params[:purchase_channel])
    render json: @orders
  end
  #Function to pass the status parameter, which will be used in the route 
  def by_status
    @orders = Order.by_status(params[:status])
    render json: @orders
  end

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders

  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  #It is good practice to declare callback methods as private
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:ref, :purchase_channel, :cliente_name, :address, :total_value, :line_items, :status, :batch_id, :delivery_service)
    end
end
