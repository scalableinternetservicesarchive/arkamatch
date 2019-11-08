require 'test_helper'

class GrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gro = gros(:one)
  end

  test "should get index" do
    get gros_url
    assert_response :success
  end

  test "should get new" do
    get new_gro_url
    assert_response :success
  end

  test "should create gro" do
    assert_difference('Gro.count') do
      post gros_url, params: { gro: { version: @gro.version } }
    end

    assert_redirected_to gro_url(Gro.last)
  end

  test "should show gro" do
    get gro_url(@gro)
    assert_response :success
  end

  test "should get edit" do
    get edit_gro_url(@gro)
    assert_response :success
  end

  test "should update gro" do
    patch gro_url(@gro), params: { gro: { version: @gro.version } }
    assert_redirected_to gro_url(@gro)
  end

  test "should destroy gro" do
    assert_difference('Gro.count', -1) do
      delete gro_url(@gro)
    end

    assert_redirected_to gros_url
  end
end
