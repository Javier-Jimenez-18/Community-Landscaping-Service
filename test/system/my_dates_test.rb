require "application_system_test_case"

class MyDatesTest < ApplicationSystemTestCase
  setup do
    @my_date = my_dates(:one)
  end

  test "visiting the index" do
    visit my_dates_url
    assert_selector "h1", text: "My Dates"
  end

  test "creating a My date" do
    visit my_dates_url
    click_on "New My Date"

    click_on "Create My date"

    assert_text "My date was successfully created"
    click_on "Back"
  end

  test "updating a My date" do
    visit my_dates_url
    click_on "Edit", match: :first

    click_on "Update My date"

    assert_text "My date was successfully updated"
    click_on "Back"
  end

  test "destroying a My date" do
    visit my_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My date was successfully destroyed"
  end
end
