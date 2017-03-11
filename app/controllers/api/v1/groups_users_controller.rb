module Api::V1
  class GroupsUsersController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_groups_user, only: [:show, :update, :destroy]

    # GET /groups_users
    def index
      @groups_users = GroupsUser.all

      render json: @groups_users, status: :ok
    end

    # GET /groups_users/1
    def show
      render json: @groups_user, status: :ok
    end

    # POST /groups_users
    def create
      @groups_user = GroupsUser.new(groups_user_params)

      if @groups_user.save
        render json: @groups_user, status: :created
      else
        render json: @groups_user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /groups_users/1
    def update
      if @groups_user.update(groups_user_params)
        render json: @groups_user, status: :ok
      else
        render json: @groups_user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /groups_users/1
    def destroy
      @groups_user.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_groups_user
      @groups_user = GroupsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groups_user_params
      params.require(:groups_user).permit(:group_id, :user_id)
    end
  end
end