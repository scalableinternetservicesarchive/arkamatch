require "application_system_test_case"

class GroupVersionNumbersTest < ApplicationSystemTestCase
  setup do
    @group_version_number = group_version_numbers(:one)
  end

  test "visiting the index" do
    visit group_version_numbers_url
    assert_selector "h1", text: "Group Version Numbers"
  end

  test "creating a Group version number" do
    visit group_version_numbers_url
    click_on "New Group Version Number"

    fill_in "Version", with: @group_version_number.version
    click_on "Create Group version number"

    assert_text "Group version number was successfully created"
    click_on "Back"
  end

  test "updating a Group version number" do
    visit group_version_numbers_url
    click_on "Edit", match: :first

    fill_in "Version", with: @group_version_number.version
    click_on "Update Group version number"

    assert_text "Group version number was successfully updated"
    click_on "Back"
  end

  test "destroying a Group version number" do
    visit group_version_numbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group version number was successfully destroyed"
  end
end
