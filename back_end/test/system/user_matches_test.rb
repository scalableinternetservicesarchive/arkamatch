require "application_system_test_case"

class UserMatchesTest < ApplicationSystemTestCase
  setup do
    @user_match = user_matches(:one)
  end

  test "visiting the index" do
    visit user_matches_url
    assert_selector "h1", text: "User Matches"
  end

  test "creating a User match" do
    visit user_matches_url
    click_on "New User Match"

    fill_in "Match", with: @user_match.match
    fill_in "Num matches", with: @user_match.num_matches
    fill_in "User", with: @user_match.user
    click_on "Create User match"

    assert_text "User match was successfully created"
    click_on "Back"
  end

  test "updating a User match" do
    visit user_matches_url
    click_on "Edit", match: :first

    fill_in "Match", with: @user_match.match
    fill_in "Num matches", with: @user_match.num_matches
    fill_in "User", with: @user_match.user
    click_on "Update User match"

    assert_text "User match was successfully updated"
    click_on "Back"
  end

  test "destroying a User match" do
    visit user_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User match was successfully destroyed"
  end
end
