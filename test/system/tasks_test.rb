require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Customer", with: @task.customer
    fill_in "Due date", with: @task.due_date
    fill_in "End date", with: @task.end_date
    fill_in "Heading", with: @task.heading
    fill_in "Locatin", with: @task.locatin
    fill_in "Our ref", with: @task.our_ref
    fill_in "Parent", with: @task.parent_id
    fill_in "Start date", with: @task.start_date
    fill_in "Team", with: @task.team_id
    fill_in "User", with: @task.user_id
    fill_in "User ref", with: @task.user_ref
    fill_in "Work", with: @task.work_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    assert_selector "h1", text: "Tasks"
  end

  test "updating a Task" do
    visit task_url(@task)
    click_on "Edit", match: :first

    fill_in "Customer", with: @task.customer
    fill_in "Due date", with: @task.due_date
    fill_in "End date", with: @task.end_date
    fill_in "Heading", with: @task.heading
    fill_in "Locatin", with: @task.locatin
    fill_in "Our ref", with: @task.our_ref
    fill_in "Parent", with: @task.parent_id
    fill_in "Start date", with: @task.start_date
    fill_in "Team", with: @task.team_id
    fill_in "User", with: @task.user_id
    fill_in "User ref", with: @task.user_ref
    fill_in "Work", with: @task.work_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    assert_selector "h1", text: "Tasks"
  end

  test "destroying a Task" do
    visit edit_task_url(@task)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Task was successfully destroyed"
  end
end
