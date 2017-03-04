module Api::V1
  class UsersRolesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_users_role, only: [:show, :update, :destroy]

    # GET /users_roles
    def index
      @users_roles = UsersRole.all

      render json: @users_roles
    end

    # GET /users_roles/1
    def show
      render json: @users_role
    end

    # POST /users_roles
    def create
      @users_role = UsersRole.new(users_role_params)

      if @users_role.save
        render json: @users_role, status: :created, location: @users_role
      else
        render json: @users_role.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users_roles/1
    def update
      if @users_role.update(users_role_params)
        render json: @users_role
      else
        render json: @users_role.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users_roles/1
    def destroy
      @users_role.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_users_role
        @users_role = UsersRole.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def users_role_params
        params.require(:users_role).permit(:role)
      end
  end
end
