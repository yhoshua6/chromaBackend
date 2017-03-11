module Api::V1
  class BranchesController < ApplicationController
    before_filter :authenticate_request!
    before_action :set_branch, only: [:show, :update, :destroy]

    # GET /branches
    def index
      @branches = Branch.all

      render json: @branches, status: :ok
    end

    # GET /branches/1
    def show
      render json: @branch, status: :ok
    end

    # POST /branches
    def create
      @branch = Branch.new(branch_params)

      if @branch.save
        render json: @branch, status: :created
      else
        render json: @branch.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /branches/1
    def update
      if @branch.update(branch_params)
        render json: @branch
      else
        render json: @branch.errors, status: :unprocessable_entity
      end
    end

    # DELETE /branches/1
    def destroy
      @branch.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_branch
        if params[:filter].nil?
          @branch = Branch.find(params[:id])
        else
          @branch = Branch.find_by(params[:id]).where(branch_type: param[:filter]).first
        end

      end

      # Only allow a trusted parameter "white list" through.
      def branch_params
        params.require(:branch).permit(:title, :branch_type, :filter, :sender_name, :receiver_name, :property_type_id, :property_id, :sender_id, :receiver_id)
      end
  end
end
