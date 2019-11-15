require 'test_helper'

class MyprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myprofile = myprofiles(:one)
  end

  test "should get index" do
    get myprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_myprofile_url
    assert_response :success
  end

  test "should create myprofile" do
    assert_difference('Myprofile.count') do
      post myprofiles_url, params: { myprofile: {  } }
    end

    assert_redirected_to myprofile_url(Myprofile.last)
  end

  test "should show myprofile" do
    get myprofile_url(@myprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_myprofile_url(@myprofile)
    assert_response :success
  end

  test "should update myprofile" do
    patch myprofile_url(@myprofile), params: { myprofile: {  } }
    assert_redirected_to myprofile_url(@myprofile)
  end

  test "should destroy myprofile" do
    assert_difference('Myprofile.count', -1) do
      delete myprofile_url(@myprofile)
    end

    assert_redirected_to myprofiles_url
  end
end
