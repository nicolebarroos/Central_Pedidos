module Api
  module V1
    class BatchesController < ApplicationController
      before_action :set_batch, only: [:show, :update, :destroy]
      has_scope :by_status_batches

      #Filter certain status of registered batches
      def by_status_batches
        @batches = Batch.by_status_batches(params[:status])
        render json: @batches
      end
  
      # GET /api/v1/batches
      def index
        @batches = Batch.all
        render json: @batches
      end
  
      # GET /api/v1/batch/1
      def show
        render json: @batch
      end
  
      # POST /api/v1/batch
      def create
        @batch = Batch.new(batch_params)
  
        if @batch.save
          render json: @batch, status: :created
        else
          render json: @batch.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/v1/batches/1
      def update
        if @batch.update(batch_params)
          render json: @batch
        else
          render json: @batch.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/v1/batches/1
      def destroy
        @batch.destroy
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_batch
          @batch = Batch.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def batch_params
          params.require(:batch).permit(:ref, :purchase_channel, :status, :delivery_service)
        end
    end
  end
end
  