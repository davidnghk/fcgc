require "application_system_test_case"

class TaskitemsTest < ApplicationSystemTestCase
  setup do
    @taskitem = taskitems(:one)
  end

  test "visiting the index" do
    visit taskitems_url
    assert_selector "h1", text: "Taskitems"
  end

  test "creating a Taskitem" do
    visit taskitems_url
    click_on "New Taskitem"

    fill_in "Model", with: @taskitem.model
    fill_in "Rating", with: @taskitem.rating
    fill_in "Remarks", with: @taskitem.remarks
    fill_in "Serial number", with: @taskitem.serial_number
    fill_in "Task", with: @taskitem.task_id
    fill_in "Workitem", with: @taskitem.workitem_id
    click_on "Create Taskitem"

    assert_text "Taskitem was successfully created"
    assert_selector "h1", text: "Taskitems"
  end

  test "updating a Taskitem" do
    visit taskitem_url(@taskitem)
    click_on "Edit", match: :first

    fill_in "Model", with: @taskitem.model
    fill_in "Rating", with: @taskitem.rating
    fill_in "Remarks", with: @taskitem.remarks
    fill_in "Serial number", with: @taskitem.serial_number
    fill_in "Task", with: @taskitem.task_id
    fill_in "Workitem", with: @taskitem.workitem_id
    click_on "Update Taskitem"

    assert_text "Taskitem was successfully updated"
    assert_selector "h1", text: "Taskitems"
  end

  test "destroying a Taskitem" do
    visit edit_taskitem_url(@taskitem)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Taskitem was successfully destroyed"
  end
end
