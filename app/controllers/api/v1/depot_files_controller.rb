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
      extension = File.extname(@depot_file.path_file)
      type = (extension === '.pdf') ?  'application/pdf' : 'image/*'
      disposition = (extension === '.pdf') ?  'attachment' : 'inline'
      data = open(@depot_file.path_file)
      send_data(
          data.read,
          filename: File.basename(@depot_file.path_file),
          type: type,
          disposition: disposition,
          stream: 'true',
          buffer_size: '4096'
      )
      #render json: @depot_file, status: :ok
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
      if @depot_file.destroy
        FileUtils.rm @depot_file.path_file
      else
        render json: @depot_file.errors, status: :unprocessable_entity
      end
    end

    private
      def save_incoming_file
        file_name = params[:depot_file][:file_name]
        location = params[:depot_file][:location]
        file = params[:depot_file][:file]
        dir_base = Dir.pwd + "/files/#{location}/#{params[:depot_file][:owner_id]}"
        FileUtils.mkdir_p(dir_base) if !File.directory? dir_base
        path_to_file = dir_base + "/#{file_name}#{File.extname(params[:depot_file][:originalName])}"
        if File.exist? path_to_file
          path_to_file = dir_base + "/#{file_name}#{1 + rand(1000)}#{File.extname(params[:depot_file][:originalName])}"
        end
        FileUtils.cp file.tempfile, path_to_file
        params[:depot_file][:path_file] = path_to_file
        params[:depot_file].delete :file
        params[:depot_file].delete :location
        params[:depot_file].delete :originalName
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_depot_file
        @depot_file = DepotFile.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def depot_file_params
        params.require(:depot_file).permit(:owner_id, :location, :originalName, :file, :path_file, :file_name)
      end
  end
end
