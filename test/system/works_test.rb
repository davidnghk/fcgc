require "application_system_test_case"

class WorksTest < ApplicationSystemTestCase
  setup do
    @work = works(:one)
  end

  test "visiting the index" do
    visit works_url
    assert_selector "h1", text: "Works"
  end

  test "creating a Work" do
    visit works_url
    click_on "New Work"

    fill_in "Code", with: @work.code
    fill_in "Local name", with: @work.local_name
    fill_in "Name", with: @work.name
    fill_in "Team", with: @work.team_id
    click_on "Create Work"

    assert_text "Work was successfully created"
    assert_selector "h1", text: "Works"
  end

  test "updating a Work" do
    visit work_url(@work)
    click_on "Edit", match: :first

    fill_in "Code", with: @work.code
    fill_in "Local name", with: @work.local_name
    fill_in "Name", with: @work.name
    fill_in "Team", with: @work.team_id
    click_on "Update Work"

    assert_text "Work was successfully updated"
    assert_selector "h1", text: "Works"
  end

  test "destroying a Work" do
    visit edit_work_url(@work)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Work was successfully destroyed"
  end
end
