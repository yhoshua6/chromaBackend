require 'test_helper'

class DepotFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @depot_file = depot_files(:one)
  end

  test "should get index" do
    get depot_files_url, as: :json
    assert_response :success
  end

  test "should create depot_file" do
    assert_difference('DepotFile.count') do
      post depot_files_url, params: { depot_file: { file_name: @depot_file.file_name, owner_id: @depot_file.owner_id, path_file: @depot_file.path_file, receiver_id: @depot_file.receiver_id, type_transaction: @depot_file.type_transaction } }, as: :json
    end

    assert_response 201
  end

  test "should show depot_file" do
    get depot_file_url(@depot_file), as: :json
    assert_response :success
  end

  test "should update depot_file" do
    patch depot_file_url(@depot_file), params: { depot_file: { file_name: @depot_file.file_name, owner_id: @depot_file.owner_id, path_file: @depot_file.path_file, receiver_id: @depot_file.receiver_id, type_transaction: @depot_file.type_transaction } }, as: :json
    assert_response 200
  end

  test "should destroy depot_file" do
    assert_difference('DepotFile.count', -1) do
      delete depot_file_url(@depot_file), as: :json
    end

    assert_response 204
  end
end
