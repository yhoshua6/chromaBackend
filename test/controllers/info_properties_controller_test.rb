require 'test_helper'

class InfoPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_property = info_properties(:one)
  end

  test "should get index" do
    get info_properties_url, as: :json
    assert_response :success
  end

  test "should create info_property" do
    assert_difference('InfoProperty.count') do
      post info_properties_url, params: { info_property: { description: @info_property.description, name: @info_property.name, notes: @info_property.notes, property_id: @info_property.property_id, property_type: @info_property.property_type, surface_in: @info_property.surface_in, surface_out: @info_property.surface_out, surface_total: @info_property.surface_total } }, as: :json
    end

    assert_response 201
  end

  test "should show info_property" do
    get info_property_url(@info_property), as: :json
    assert_response :success
  end

  test "should update info_property" do
    patch info_property_url(@info_property), params: { info_property: { description: @info_property.description, name: @info_property.name, notes: @info_property.notes, property_id: @info_property.property_id, property_type: @info_property.property_type, surface_in: @info_property.surface_in, surface_out: @info_property.surface_out, surface_total: @info_property.surface_total } }, as: :json
    assert_response 200
  end

  test "should destroy info_property" do
    assert_difference('InfoProperty.count', -1) do
      delete info_property_url(@info_property), as: :json
    end

    assert_response 204
  end
end
