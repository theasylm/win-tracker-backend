require "application_system_test_case"

class FormatsTest < ApplicationSystemTestCase
  setup do
    @format = formats(:one)
  end

  test "visiting the index" do
    visit formats_url
    assert_selector "h1", text: "Formats"
  end

  test "should create format" do
    visit formats_url
    click_on "New format"

    fill_in "Name", with: @format.name
    click_on "Create Format"

    assert_text "Format was successfully created"
    click_on "Back"
  end

  test "should update Format" do
    visit format_url(@format)
    click_on "Edit this format", match: :first

    fill_in "Name", with: @format.name
    click_on "Update Format"

    assert_text "Format was successfully updated"
    click_on "Back"
  end

  test "should destroy Format" do
    visit format_url(@format)
    click_on "Destroy this format", match: :first

    assert_text "Format was successfully destroyed"
  end
end
