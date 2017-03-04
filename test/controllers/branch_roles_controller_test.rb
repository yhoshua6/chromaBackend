require 'test_helper'

class BranchRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch_role = branch_roles(:one)
  end

  test "should get index" do
    get branch_roles_url, as: :json
    assert_response :success
  end

  test "should create branch_role" do
    assert_difference('BranchRole.count') do
      post branch_roles_url, params: { branch_role: { branch_id: @branch_role.branch_id, receiver_id: @branch_role.receiver_id, sender_id: @branch_role.sender_id } }, as: :json
    end

    assert_response 201
  end

  test "should show branch_role" do
    get branch_role_url(@branch_role), as: :json
    assert_response :success
  end

  test "should update branch_role" do
    patch branch_role_url(@branch_role), params: { branch_role: { branch_id: @branch_role.branch_id, receiver_id: @branch_role.receiver_id, sender_id: @branch_role.sender_id } }, as: :json
    assert_response 200
  end

  test "should destroy branch_role" do
    assert_difference('BranchRole.count', -1) do
      delete branch_role_url(@branch_role), as: :json
    end

    assert_response 204
  end
end
