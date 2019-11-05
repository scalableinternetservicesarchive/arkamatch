require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @title_suffix = "Arkamatch"
  end

  test 'should get root like home' do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@title_suffix}"
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | #{@title_suffix}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@title_suffix}"
  end

end
