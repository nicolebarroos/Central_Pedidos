class BatchesController < ApplicationController
    before_action :set_batch, only: [:show, :update, :destroy]
    has_scope :by_status_batches

    #Filter certain status of registered batches
    def by_status_batches
      @batches = Batch.by_status_batches(params[:status])
      render json: @batches
    end
  
    # GET /batches
    def index
      @batches = Batch.all
      render json: @batches
    end
  
    # GET /batch/1
    def show
      render json: @batches
    end
  
    # POST /batch
    def create
      @batch = Batch.new(batch_params)
  
      if @batch.save
        render json: @batch, status: :created, location: @batch
      else
        render json: @batch.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /batches/1
    def update
      if @batch.update(batch_params)
        render json: @batch
      else
        render json: @batch.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /batches/1
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
        params.require(:batch).permit(:ref, :purchase_channel, :status)
      end
  end
  