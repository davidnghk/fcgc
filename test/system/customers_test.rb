require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Code", with: @customer.code
    fill_in "Local name", with: @customer.local_name
    fill_in "Name", with: @customer.name
    fill_in "Team", with: @customer.team_id
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    assert_selector "h1", text: "Customers"
  end

  test "updating a Customer" do
    visit customer_url(@customer)
    click_on "Edit", match: :first

    fill_in "Code", with: @customer.code
    fill_in "Local name", with: @customer.local_name
    fill_in "Name", with: @customer.name
    fill_in "Team", with: @customer.team_id
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    assert_selector "h1", text: "Customers"
  end

  test "destroying a Customer" do
    visit edit_customer_url(@customer)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Customer was successfully destroyed"
  end
end
