module Api::V1
  class BranchesRolesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_branches_role, only: [:show]
    before_action :set_branch, only: [:update, :destroy]

    # GET /branches_roles
    def index
      @branches_roles = BranchesRole.all

      render json: @branches_roles, status: :ok
    end

    # GET /branches_roles/1
    def show
      render json: @branches_role, status: :ok
    end

    # POST /branches_roles
    def create
      @branches_role = BranchesRole.new(branches_role_params)

      if @branches_role.save
        render json: @branches_role, status: :created
      else
        render json: @branches_role.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /branches_roles/1
    def update
      if @branches_role.update(branches_role_params)
        render json: @branches_role, status: :ok
      else
        render json: @branches_role.errors, status: :unprocessable_entity
      end
    end

    # DELETE /branches_roles/1
    def destroy
      @branches_role.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_branches_role
      @branches_role = BranchesRole.where("sender_id = ? OR receiver_id = ?", params[:id], params[:id])
    end

    def set_branch
      @branches_role = BranchesRole.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def branches_role_params
      params.require(:branches_role).permit(:branch_id, :sender_id, :receiver_id, :branch_type)
    end
  end
end