require 'test_helper'

class UpdateViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @update_view = update_views(:one)
  end

  test "should get index" do
    get update_views_url
    assert_response :success
  end

  test "should get new" do
    get new_update_view_url
    assert_response :success
  end

  test "should create update_view" do
    assert_difference('UpdateView.count') do
      post update_views_url, params: { update_view: {  } }
    end

    assert_redirected_to update_view_url(UpdateView.last)
  end

  test "should show update_view" do
    get update_view_url(@update_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_update_view_url(@update_view)
    assert_response :success
  end

  test "should update update_view" do
    patch update_view_url(@update_view), params: { update_view: {  } }
    assert_redirected_to update_view_url(@update_view)
  end

  test "should destroy update_view" do
    assert_difference('UpdateView.count', -1) do
      delete update_view_url(@update_view)
    end

    assert_redirected_to update_views_url
  end
end
