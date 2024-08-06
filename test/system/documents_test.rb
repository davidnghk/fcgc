require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "creating a Document" do
    visit documents_url
    click_on "New Document"

    fill_in "Aasm state", with: @document.aasm_state
    fill_in "Code", with: @document.code
    fill_in "Description", with: @document.description
    fill_in "Team", with: @document.team_id
    fill_in "User ref", with: @document.user_ref
    click_on "Create Document"

    assert_text "Document was successfully created"
    assert_selector "h1", text: "Documents"
  end

  test "updating a Document" do
    visit document_url(@document)
    click_on "Edit", match: :first

    fill_in "Aasm state", with: @document.aasm_state
    fill_in "Code", with: @document.code
    fill_in "Description", with: @document.description
    fill_in "Team", with: @document.team_id
    fill_in "User ref", with: @document.user_ref
    click_on "Update Document"

    assert_text "Document was successfully updated"
    assert_selector "h1", text: "Documents"
  end

  test "destroying a Document" do
    visit edit_document_url(@document)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Document was successfully destroyed"
  end
end
