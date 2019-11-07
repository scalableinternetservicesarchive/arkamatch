require 'test_helper'

class UserMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_match = user_matches(:one)
  end

  test "should get index" do
    get user_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_user_match_url
    assert_response :success
  end

  test "should create user_match" do
    assert_difference('UserMatch.count') do
      post user_matches_url, params: { user_match: { match: @user_match.match, num_matches: @user_match.num_matches, user: @user_match.user } }
    end

    assert_redirected_to user_match_url(UserMatch.last)
  end

  test "should show user_match" do
    get user_match_url(@user_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_match_url(@user_match)
    assert_response :success
  end

  test "should update user_match" do
    patch user_match_url(@user_match), params: { user_match: { match: @user_match.match, num_matches: @user_match.num_matches, user: @user_match.user } }
    assert_redirected_to user_match_url(@user_match)
  end

  test "should destroy user_match" do
    assert_difference('UserMatch.count', -1) do
      delete user_match_url(@user_match)
    end

    assert_redirected_to user_matches_url
  end
end
