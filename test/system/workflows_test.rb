require "application_system_test_case"

class WorkflowsTest < ApplicationSystemTestCase
  setup do
    @workflow = workflows(:one)
  end

  test "visiting the index" do
    visit workflows_url
    assert_selector "h1", text: "Workflows"
  end

  test "creating a Workflow" do
    visit workflows_url
    click_on "New Workflow"

    fill_in "Code", with: @workflow.code
    fill_in "Local name", with: @workflow.local_name
    fill_in "Name", with: @workflow.name
    click_on "Create Workflow"

    assert_text "Workflow was successfully created"
    assert_selector "h1", text: "Workflows"
  end

  test "updating a Workflow" do
    visit workflow_url(@workflow)
    click_on "Edit", match: :first

    fill_in "Code", with: @workflow.code
    fill_in "Local name", with: @workflow.local_name
    fill_in "Name", with: @workflow.name
    click_on "Update Workflow"

    assert_text "Workflow was successfully updated"
    assert_selector "h1", text: "Workflows"
  end

  test "destroying a Workflow" do
    visit edit_workflow_url(@workflow)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Workflow was successfully destroyed"
  end
end
