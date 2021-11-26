require "application_system_test_case"

class OutletsTest < ApplicationSystemTestCase
  setup do
    @outlet = outlets(:one)
  end

  test "visiting the index" do
    visit outlets_url
    assert_selector "h1", text: "Outlets"
  end

  test "creating a Outlet" do
    visit outlets_url
    click_on "New Outlet"

    fill_in "Location", with: @outlet.location
    fill_in "Name", with: @outlet.name
    click_on "Create Outlet"

    assert_text "Outlet was successfully created"
    click_on "Back"
  end

  test "updating a Outlet" do
    visit outlets_url
    click_on "Edit", match: :first

    fill_in "Location", with: @outlet.location
    fill_in "Name", with: @outlet.name
    click_on "Update Outlet"

    assert_text "Outlet was successfully updated"
    click_on "Back"
  end

  test "destroying a Outlet" do
    visit outlets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outlet was successfully destroyed"
  end
end
