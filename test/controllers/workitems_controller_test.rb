require 'test_helper'

class WorkitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workitem = workitems(:one)
  end

  test "should get index" do
    get workitems_url
    assert_response :success
  end

  test "should get new" do
    get new_workitem_url
    assert_response :success
  end

  test "should create workitem" do
    assert_difference('Workitem.count') do
      post workitems_url, params: { workitem: { code: @workitem.code, local_name: @workitem.local_name, name: @workitem.name, work_id: @workitem.work_id } }
    end

    assert_redirected_to workitem_url(Workitem.last)
  end

  test "should show workitem" do
    get workitem_url(@workitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_workitem_url(@workitem)
    assert_response :success
  end

  test "should update workitem" do
    patch workitem_url(@workitem), params: { workitem: { code: @workitem.code, local_name: @workitem.local_name, name: @workitem.name, work_id: @workitem.work_id } }
    assert_redirected_to workitem_url(@workitem)
  end

  test "should destroy workitem" do
    assert_difference('Workitem.count', -1) do
      delete workitem_url(@workitem)
    end

    assert_redirected_to workitems_url
  end
end
