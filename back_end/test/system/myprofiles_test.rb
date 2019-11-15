require "application_system_test_case"

class MyprofilesTest < ApplicationSystemTestCase
  setup do
    @myprofile = myprofiles(:one)
  end

  test "visiting the index" do
    visit myprofiles_url
    assert_selector "h1", text: "Myprofiles"
  end

  test "creating a Myprofile" do
    visit myprofiles_url
    click_on "New Myprofile"

    click_on "Create Myprofile"

    assert_text "Myprofile was successfully created"
    click_on "Back"
  end

  test "updating a Myprofile" do
    visit myprofiles_url
    click_on "Edit", match: :first

    click_on "Update Myprofile"

    assert_text "Myprofile was successfully updated"
    click_on "Back"
  end

  test "destroying a Myprofile" do
    visit myprofiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Myprofile was successfully destroyed"
  end
end
