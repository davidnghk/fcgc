require "application_system_test_case"

class IconsTest < ApplicationSystemTestCase
  setup do
    @icon = icons(:one)
  end

  test "visiting the index" do
    visit icons_url
    assert_selector "h1", text: "Icons"
  end

  test "creating a Icon" do
    visit icons_url
    click_on "New Icon"

    fill_in "Code", with: @icon.code
    fill_in "Local name", with: @icon.local_name
    fill_in "Name", with: @icon.name
    click_on "Create Icon"

    assert_text "Icon was successfully created"
    assert_selector "h1", text: "Icons"
  end

  test "updating a Icon" do
    visit icon_url(@icon)
    click_on "Edit", match: :first

    fill_in "Code", with: @icon.code
    fill_in "Local name", with: @icon.local_name
    fill_in "Name", with: @icon.name
    click_on "Update Icon"

    assert_text "Icon was successfully updated"
    assert_selector "h1", text: "Icons"
  end

  test "destroying a Icon" do
    visit edit_icon_url(@icon)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Icon was successfully destroyed"
  end
end
