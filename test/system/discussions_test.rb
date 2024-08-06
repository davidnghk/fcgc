require "application_system_test_case"

class DiscussionsTest < ApplicationSystemTestCase
  setup do
    @discussion = discussions(:one)
  end

  test "visiting the index" do
    visit discussions_url
    assert_selector "h1", text: "Discussions"
  end

  test "creating a Discussion" do
    visit discussions_url
    click_on "New Discussion"

    fill_in "Title", with: @discussion.title
    fill_in "User", with: @discussion.user_id
    click_on "Create Discussion"

    assert_text "Discussion was successfully created"
    assert_selector "h1", text: "Discussions"
  end

  test "updating a Discussion" do
    visit discussion_url(@discussion)
    click_on "Edit", match: :first

    fill_in "Title", with: @discussion.title
    fill_in "User", with: @discussion.user_id
    click_on "Update Discussion"

    assert_text "Discussion was successfully updated"
    assert_selector "h1", text: "Discussions"
  end

  test "destroying a Discussion" do
    visit edit_discussion_url(@discussion)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Discussion was successfully destroyed"
  end
end
