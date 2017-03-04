module Api::V1
  class InfoPropertiesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_info_property, only: [:show, :update, :destroy]

    # GET /info_properties
    def index
      @info_properties = InfoProperty.all

      render json: @info_properties, status: :ok
    end

    # GET /info_properties/1
    def show
      render json: @info_property, status: :ok
    end

    # POST /info_properties
    def create
      @info_property = InfoProperty.new(info_property_params)

      if @info_property.save
        render json: @info_property, status: :created
      else
        render json: @info_property.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /info_properties/1
    def update
      if @info_property.update(info_property_params)
        render json: @info_property
      else
        render json: @info_property.errors, status: :unprocessable_entity
      end
    end

    # DELETE /info_properties/1
    def destroy
      @info_property.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_info_property
        @info_property = InfoProperty.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def info_property_params
        params.require(:info_property).permit(:property_id, :property_type, :name, :description, :surface_total, :surface_in, :surface_out, :notes)
      end
  end
end
