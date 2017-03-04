module Api::V1
  class NotificationsRolesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_notifications_role, only: [:show, :update, :destroy]

    # GET /notifications_roles
    def index
      @notifications_roles = NotificationsRole.all

      render json: @notifications_roles, status: :ok
    end

    # GET /notifications_roles/1
    def show
      render json: @notifications_role, status: :ok
    end

    # POST /notifications_roles
    def create
      @notifications_role = NotificationsRole.new(notifications_role_params)

      if @notifications_role.save
        render json: @notifications_role, status: :created
      else
        render json: @notifications_role.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /notifications_roles/1
    def update
      if @notifications_role.update(notifications_role_params)
        render json: @notifications_role
      else
        render json: @notifications_role.errors, status: :unprocessable_entity
      end
    end

    # DELETE /notifications_roles/1
    def destroy
      @notifications_role.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_notifications_role
        @notifications_role = NotificationsRole.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def notifications_role_params
        params.require(:notifications_role).permit(:notification_id, :receiver_id)
      end
  end
end
