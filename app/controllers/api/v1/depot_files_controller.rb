module Api::V1
  class DepotFilesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_depot_file, only: [:show, :update, :destroy]

    # GET /depot_files
    def index
      @depot_files = DepotFile.all

      render json: @depot_files, status: :ok
    end

    # GET /depot_files/1
    def show
      render json: @depot_file, status: :ok
    end

    # POST /depot_files
    def create
      save_incoming_file
      @depot_file = DepotFile.new(depot_file_params)

      if @depot_file.save
        render json: @depot_file, status: :created
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

      def save_incoming_file
        file_name = params[:depot_file][:file_name]
        file = params[:depot_file][:file]
        FileUtils.cp file.tempfile, Dir.pwd + "/files/bills/#{file_name}"
        params[:depot_file].delete :file_name
        params[:depot_file].delete :file
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_depot_file
        @depot_file = DepotFile.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def depot_file_params
        params.require(:depot_file).permit(:owner_id, :receiver_id, :file, :path_file, :file_name)
      end
  end
end
