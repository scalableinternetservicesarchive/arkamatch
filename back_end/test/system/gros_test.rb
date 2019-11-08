require "application_system_test_case"

class GrosTest < ApplicationSystemTestCase
  setup do
    @gro = gros(:one)
  end

  test "visiting the index" do
    visit gros_url
    assert_selector "h1", text: "Gros"
  end

  test "creating a Gro" do
    visit gros_url
    click_on "New Gro"

    fill_in "Version", with: @gro.version
    click_on "Create Gro"

    assert_text "Gro was successfully created"
    click_on "Back"
  end

  test "updating a Gro" do
    visit gros_url
    click_on "Edit", match: :first

    fill_in "Version", with: @gro.version
    click_on "Update Gro"

    assert_text "Gro was successfully updated"
    click_on "Back"
  end

  test "destroying a Gro" do
    visit gros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gro was successfully destroyed"
  end
end
