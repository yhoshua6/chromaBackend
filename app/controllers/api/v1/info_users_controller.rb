module Api::V1
  class InfoUsersController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_info_user, only: [:show, :update, :destroy]

    # GET /info_users
    def index
      @info_users = InfoUser.all

      render json: @info_users, status: :ok
    end

    # GET /info_users/1
    def show
      render json: @info_user, status: :ok
    end

    # POST /info_users
    def create
      @info_user = InfoUser.new(info_user_params)

      if @info_user.save
        render json: @info_user, status: :created
      else
        render json: @info_user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /info_users/1
    def update
      if @info_user.update(info_user_params)
        render json: @info_user
      else
        render json: @info_user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /info_users/1
    def destroy
      @info_user.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_info_user
        @info_user = InfoUser.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def info_user_params
        params.require(:info_user).permit(:user_id, :name, :email, :cellphone, :part_of_pool, :payment_method, :bank_name, :bank_account, :bank_clabe, :cedula)
      end
  end
end
