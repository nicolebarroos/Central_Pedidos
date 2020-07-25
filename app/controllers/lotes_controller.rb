class LotesController < ApplicationController
    before_action :set_lote, only: [:show, :update, :destroy]
  
    # GET /pedidos
    def index
      @lotes = Lote.all
  
      render json: @lotes
    end
  
    # GET /pedidos/1
    def show
      render json: @lotes
    end
  
    # POST /pedidos
    def create
      @lote = Lote.new(lote_params)
  
      if @lote.save
        render json: @lote, status: :created, location: @lote
      else
        render json: @lote.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /pedidos/1
    def update
      if @lote.update(lote_params)
        render json: @lote
      else
        render json: @lote.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /pedidos/1
    def destroy
      @lote.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lote
        @lote = Lote.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def lote_params
        params.require(:lote).permit(:ref, :canal_compra)
      end
  end
  