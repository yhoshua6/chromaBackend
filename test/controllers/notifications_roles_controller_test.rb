require 'test_helper'

class NotificationsRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notifications_role = notifications_roles(:one)
  end

  test "should get index" do
    get notifications_roles_url, as: :json
    assert_response :success
  end

  test "should create notifications_role" do
    assert_difference('NotificationsRole.count') do
      post notifications_roles_url, params: { notifications_role: { notification_id: @notifications_role.notification_id, receiver_id: @notifications_role.receiver_id } }, as: :json
    end

    assert_response 201
  end

  test "should show notifications_role" do
    get notifications_role_url(@notifications_role), as: :json
    assert_response :success
  end

  test "should update notifications_role" do
    patch notifications_role_url(@notifications_role), params: { notifications_role: { notification_id: @notifications_role.notification_id, receiver_id: @notifications_role.receiver_id } }, as: :json
    assert_response 200
  end

  test "should destroy notifications_role" do
    assert_difference('NotificationsRole.count', -1) do
      delete notifications_role_url(@notifications_role), as: :json
    end

    assert_response 204
  end
end
