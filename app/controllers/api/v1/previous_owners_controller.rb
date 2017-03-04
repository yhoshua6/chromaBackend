module Api::V1
  class PreviousOwnersController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_previous_owner, only: [:show, :update, :destroy]

    # GET /previous_owners
    def index
      @previous_owners = PreviousOwner.all

      render json: @previous_owners, status: :ok
    end

    # GET /previous_owners/1
    def show
      render json: @previous_owner, status: :ok
    end

    # POST /previous_owners
    def create
      @previous_owner = PreviousOwner.new(previous_owner_params)

      if @previous_owner.save
        render json: @previous_owner, status: :created
      else
        render json: @previous_owner.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /previous_owners/1
    def update
      if @previous_owner.update(previous_owner_params)
        render json: @previous_owner
      else
        render json: @previous_owner.errors, status: :unprocessable_entity
      end
    end

    # DELETE /previous_owners/1
    def destroy
      @previous_owner.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_previous_owner
        @previous_owner = PreviousOwner.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def previous_owner_params
        params.require(:previous_owner).permit(:property_id, :owner_id)
      end
  end
end
