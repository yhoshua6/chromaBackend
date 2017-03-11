module Api::V1
  class GroupsController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_group, only: [:show, :update, :destroy]

    # GET /groups
    def index
      @groups = Group.all

      render json: @groups, status: :ok
    end

    # GET /groups/1
    def show
      render json: @group, status: :ok
    end

    # POST /groups
    def create
      @group = Group.new(group_params)

      if @group.save
        render json: @group, status: :created
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /groups/1
    def update
      if @group.update(group_params)
        render json: @group, status: :ok
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /groups/1
    def destroy
      @group.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :groups_users)
    end
  end
end