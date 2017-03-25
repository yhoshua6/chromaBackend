module Api::V1
  class BranchRolesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_branch_role, only: [:show, :update, :destroy]

    # GET /branch_roles
    def index
      @branch_roles = BranchRole.all

      render json: @branch_roles, status: :ok
    end

    # GET /branch_roles/1
    def show
      render json: @branch_role, status: :ok
    end

    # POST /branch_roles
    def create
      @branch_role = BranchRole.new(branch_role_params)

      if @branch_role.save
        render json: @branch_role, status: :created
      else
        render json: @branch_role.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /branch_roles/1
    def update
      if @branch_role.update(branch_role_params)
        render json: @branch_role, status: :ok
      else
        render json: @branch_role.errors, status: :unprocessable_entity
      end
    end

    # DELETE /branch_roles/1
    def destroy
      @branch_role.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_role
      if params[:filter].blank?
        @branch_role = BranchRole.find(params[:id])
      else
        @branch_role = BranchRole.where("sender_id = ? AND branch_type = ?", params[:id], params[:filter]).first
        if @branch_role.blank?
          @branch_role = BranchRole.where("receiver_id = ? AND branch_type = ?", params[:id], params[:filter]).first
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_role_params
      params.require(:branch_role).permit(:branch_id, :sender_id, :receiver_id, :filter, :branch_type)
    end
  end
end