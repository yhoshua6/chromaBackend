require 'test_helper'

class PreviousOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @previous_owner = previous_owners(:one)
  end

  test "should get index" do
    get previous_owners_url, as: :json
    assert_response :success
  end

  test "should create previous_owner" do
    assert_difference('PreviousOwner.count') do
      post previous_owners_url, params: { previous_owner: { owner_id: @previous_owner.owner_id, property_id: @previous_owner.property_id } }, as: :json
    end

    assert_response 201
  end

  test "should show previous_owner" do
    get previous_owner_url(@previous_owner), as: :json
    assert_response :success
  end

  test "should update previous_owner" do
    patch previous_owner_url(@previous_owner), params: { previous_owner: { owner_id: @previous_owner.owner_id, property_id: @previous_owner.property_id } }, as: :json
    assert_response 200
  end

  test "should destroy previous_owner" do
    assert_difference('PreviousOwner.count', -1) do
      delete previous_owner_url(@previous_owner), as: :json
    end

    assert_response 204
  end
end
