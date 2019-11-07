require 'test_helper'

class GroupVersionNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_version_number = group_version_numbers(:one)
  end

  test "should get index" do
    get group_version_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_group_version_number_url
    assert_response :success
  end

  test "should create group_version_number" do
    assert_difference('GroupVersionNumber.count') do
      post group_version_numbers_url, params: { group_version_number: { version: @group_version_number.version } }
    end

    assert_redirected_to group_version_number_url(GroupVersionNumber.last)
  end

  test "should show group_version_number" do
    get group_version_number_url(@group_version_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_version_number_url(@group_version_number)
    assert_response :success
  end

  test "should update group_version_number" do
    patch group_version_number_url(@group_version_number), params: { group_version_number: { version: @group_version_number.version } }
    assert_redirected_to group_version_number_url(@group_version_number)
  end

  test "should destroy group_version_number" do
    assert_difference('GroupVersionNumber.count', -1) do
      delete group_version_number_url(@group_version_number)
    end

    assert_redirected_to group_version_numbers_url
  end
end
