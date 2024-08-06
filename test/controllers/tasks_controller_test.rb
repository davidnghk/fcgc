require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { customer: @task.customer, due_date: @task.due_date, end_date: @task.end_date, heading: @task.heading, locatin: @task.locatin, our_ref: @task.our_ref, parent_id: @task.parent_id, start_date: @task.start_date, team_id: @task.team_id, user_id: @task.user_id, user_ref: @task.user_ref, work_id: @task.work_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { customer: @task.customer, due_date: @task.due_date, end_date: @task.end_date, heading: @task.heading, locatin: @task.locatin, our_ref: @task.our_ref, parent_id: @task.parent_id, start_date: @task.start_date, team_id: @task.team_id, user_id: @task.user_id, user_ref: @task.user_ref, work_id: @task.work_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
