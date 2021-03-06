module Api::V1
  class NotificationsController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_notification, only: [:show, :update, :destroy]

    # GET /notifications
    def index
      @notifications = Notification.all

      render json: @notifications, status: :ok
    end

    # GET /notifications/1
    def show
      render json: @notification, status: :ok
    end

    # POST /notifications
    def create
      @notification = Notification.new(notification_params)

      if @notification.save
        render json: @notification, status: :created
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /notifications/1
    def update
      if @notification.update(notification_params)
        render json: @notification
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end

    # DELETE /notifications/1
    def destroy
      @notification.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_notification
        @notification = Notification.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def notification_params
        params.require(:notification).permit(:user_id, :title, :content, :receiver_user, :notifications_roles_id)
      end
  end
end
