require "application_system_test_case"

class CommandersTest < ApplicationSystemTestCase
  setup do
    @commander = commanders(:one)
  end

  test "visiting the index" do
    visit commanders_url
    assert_selector "h1", text: "Commanders"
  end

  test "should create commander" do
    visit commanders_url
    click_on "New commander"

    fill_in "Name", with: @commander.name
    click_on "Create Commander"

    assert_text "Commander was successfully created"
    click_on "Back"
  end

  test "should update Commander" do
    visit commander_url(@commander)
    click_on "Edit this commander", match: :first

    fill_in "Name", with: @commander.name
    click_on "Update Commander"

    assert_text "Commander was successfully updated"
    click_on "Back"
  end

  test "should destroy Commander" do
    visit commander_url(@commander)
    click_on "Destroy this commander", match: :first

    assert_text "Commander was successfully destroyed"
  end
end
