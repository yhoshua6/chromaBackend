require 'test_helper'

class UsersRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_role = users_roles(:one)
  end

  test "should get index" do
    get users_roles_url, as: :json
    assert_response :success
  end

  test "should create users_role" do
    assert_difference('UsersRole.count') do
      post users_roles_url, params: { users_role: { role: @users_role.role } }, as: :json
    end

    assert_response 201
  end

  test "should show users_role" do
    get users_role_url(@users_role), as: :json
    assert_response :success
  end

  test "should update users_role" do
    patch users_role_url(@users_role), params: { users_role: { role: @users_role.role } }, as: :json
    assert_response 200
  end

  test "should destroy users_role" do
    assert_difference('UsersRole.count', -1) do
      delete users_role_url(@users_role), as: :json
    end

    assert_response 204
  end
end
