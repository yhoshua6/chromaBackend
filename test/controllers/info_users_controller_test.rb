require 'test_helper'

class InfoUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_user = info_users(:one)
  end

  test "should get index" do
    get info_users_url, as: :json
    assert_response :success
  end

  test "should create info_user" do
    assert_difference('InfoUser.count') do
      post info_users_url, params: { info_user: { bank_account: @info_user.bank_account, bank_clabe: @info_user.bank_clabe, bank_name: @info_user.bank_name, cedula: @info_user.cedula, cellphone: @info_user.cellphone, email: @info_user.email, name: @info_user.name, part_of_pool: @info_user.part_of_pool, payment_method: @info_user.payment_method, user_id: @info_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show info_user" do
    get info_user_url(@info_user), as: :json
    assert_response :success
  end

  test "should update info_user" do
    patch info_user_url(@info_user), params: { info_user: { bank_account: @info_user.bank_account, bank_clabe: @info_user.bank_clabe, bank_name: @info_user.bank_name, cedula: @info_user.cedula, cellphone: @info_user.cellphone, email: @info_user.email, name: @info_user.name, part_of_pool: @info_user.part_of_pool, payment_method: @info_user.payment_method, user_id: @info_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy info_user" do
    assert_difference('InfoUser.count', -1) do
      delete info_user_url(@info_user), as: :json
    end

    assert_response 204
  end
end
