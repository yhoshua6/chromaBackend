require 'test_helper'

class BranchesRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branches_role = branches_roles(:one)
  end

  test "should get index" do
    get branches_roles_url, as: :json
    assert_response :success
  end

  test "should create branches_role" do
    assert_difference('BranchesRole.count') do
      post branches_roles_url, params: { branches_role: { branch_id: @branches_role.branch_id, branch_type: @branches_role.branch_type, receiver_id: @branches_role.receiver_id, sender_id: @branches_role.sender_id } }, as: :json
    end

    assert_response 201
  end

  test "should show branches_role" do
    get branches_role_url(@branches_role), as: :json
    assert_response :success
  end

  test "should update branches_role" do
    patch branches_role_url(@branches_role), params: { branches_role: { branch_id: @branches_role.branch_id, branch_type: @branches_role.branch_type, receiver_id: @branches_role.receiver_id, sender_id: @branches_role.sender_id } }, as: :json
    assert_response 200
  end

  test "should destroy branches_role" do
    assert_difference('BranchesRole.count', -1) do
      delete branches_role_url(@branches_role), as: :json
    end

    assert_response 204
  end
end
