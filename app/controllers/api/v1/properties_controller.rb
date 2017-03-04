module Api::V1
  class PropertiesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_property, only: [:show, :update, :destroy]

    # GET /properties
    def index
      @properties = Property.all

      render json: @properties, status: :ok
    end

    # GET /properties/1
    def show
      render json: @property, status: :ok
    end

    # POST /properties
    def create
      @property = Property.new(property_params)

      if @property.save
        render json: @property, status: :created
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /properties/1
    def update
      if @property.update(property_params)
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    # DELETE /properties/1
    def destroy
      @property.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property
        @property = Property.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def property_params
        params.require(:property).permit(:user_id, :property_type_id, :property_info_id)
      end
  end
end
