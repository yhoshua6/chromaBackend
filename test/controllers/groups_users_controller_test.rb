require 'test_helper'

class GroupsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groups_user = groups_users(:one)
  end

  test "should get index" do
    get groups_users_url, as: :json
    assert_response :success
  end

  test "should create groups_user" do
    assert_difference('GroupsUser.count') do
      post groups_users_url, params: { groups_user: { group_id: @groups_user.group_id, user_id: @groups_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show groups_user" do
    get groups_user_url(@groups_user), as: :json
    assert_response :success
  end

  test "should update groups_user" do
    patch groups_user_url(@groups_user), params: { groups_user: { group_id: @groups_user.group_id, user_id: @groups_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy groups_user" do
    assert_difference('GroupsUser.count', -1) do
      delete groups_user_url(@groups_user), as: :json
    end

    assert_response 204
  end
end
