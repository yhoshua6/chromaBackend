module Api::V1
  class PropertyTypesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_property_type, only: [:show, :update, :destroy]

    # GET /property_types
    def index
      @property_types = PropertyType.all

      render json: @property_types, status: :ok
    end

    # GET /property_types/1
    def show
      render json: @property_type, status: :ok
    end

    # POST /property_types
    def create
      @property_type = PropertyType.new(property_type_params)

      if @property_type.save
        render json: @property_type, status: :created
      else
        render json: @property_type.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /property_types/1
    def update
      if @property_type.update(property_type_params)
        render json: @property_type
      else
        render json: @property_type.errors, status: :unprocessable_entity
      end
    end

    # DELETE /property_types/1
    def destroy
      @property_type.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property_type
        @property_type = PropertyType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def property_type_params
        params.require(:property_type).permit(:property_type)
      end
  end
end
