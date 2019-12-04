require "application_system_test_case"

class UpdateViewsTest < ApplicationSystemTestCase
  setup do
    @update_view = update_views(:one)
  end

  test "visiting the index" do
    visit update_views_url
    assert_selector "h1", text: "Update Views"
  end

  test "creating a Update view" do
    visit update_views_url
    click_on "New Update View"

    click_on "Create Update view"

    assert_text "Update view was successfully created"
    click_on "Back"
  end

  test "updating a Update view" do
    visit update_views_url
    click_on "Edit", match: :first

    click_on "Update Update view"

    assert_text "Update view was successfully updated"
    click_on "Back"
  end

  test "destroying a Update view" do
    visit update_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Update view was successfully destroyed"
  end
end
