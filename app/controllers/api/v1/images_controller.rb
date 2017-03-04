module Api::V1
  class ImagesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_image, only: [:show, :update, :destroy]

    # GET /images
    def index
      @images = Image.all

      render json: @images, status: :ok
    end

    # GET /images/1
    def show
      render json: @image, status: :ok
    end

    # POST /images
    def create
      @image = Image.new(image_params)

      if @image.save
        render json: @image, status: :created
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        render json: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # DELETE /images/1
    def destroy
      @image.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Image.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:owner_id, :path, :profile)
      end
  end
end
