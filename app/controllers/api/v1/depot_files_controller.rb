module Api::V1
  class DepotFilesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_depot_file, only: [:show, :update, :destroy]

    # GET /depot_files
    def index
      @depot_files = DepotFile.all

      render json: @depot_files
    end

    # GET /depot_files/1
    def show
      render json: @depot_file
    end

    # POST /depot_files
    def create
      @depot_file = DepotFile.new(depot_file_params)

      if @depot_file.save
        render json: @depot_file, status: :created, location: @depot_file
      else
        render json: @depot_file.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /depot_files/1
    def update
      if @depot_file.update(depot_file_params)
        render json: @depot_file
      else
        render json: @depot_file.errors, status: :unprocessable_entity
      end
    end

    # DELETE /depot_files/1
    def destroy
      @depot_file.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_depot_file
        @depot_file = DepotFile.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def depot_file_params
        params.require(:depot_file).permit(:owner_id, :receiver_id, :file, :path_file, :file_name, :type_transaction)
      end
  end
end
