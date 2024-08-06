require "application_system_test_case"

class WorkitemsTest < ApplicationSystemTestCase
  setup do
    @workitem = workitems(:one)
  end

  test "visiting the index" do
    visit workitems_url
    assert_selector "h1", text: "Workitems"
  end

  test "creating a Workitem" do
    visit workitems_url
    click_on "New Workitem"

    fill_in "Code", with: @workitem.code
    fill_in "Local name", with: @workitem.local_name
    fill_in "Name", with: @workitem.name
    fill_in "Work", with: @workitem.work_id
    click_on "Create Workitem"

    assert_text "Workitem was successfully created"
    assert_selector "h1", text: "Workitems"
  end

  test "updating a Workitem" do
    visit workitem_url(@workitem)
    click_on "Edit", match: :first

    fill_in "Code", with: @workitem.code
    fill_in "Local name", with: @workitem.local_name
    fill_in "Name", with: @workitem.name
    fill_in "Work", with: @workitem.work_id
    click_on "Update Workitem"

    assert_text "Workitem was successfully updated"
    assert_selector "h1", text: "Workitems"
  end

  test "destroying a Workitem" do
    visit edit_workitem_url(@workitem)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Workitem was successfully destroyed"
  end
end
