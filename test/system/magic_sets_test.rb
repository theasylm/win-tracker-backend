require "application_system_test_case"

class MagicSetsTest < ApplicationSystemTestCase
  setup do
    @magic_set = magic_sets(:one)
  end

  test "visiting the index" do
    visit magic_sets_url
    assert_selector "h1", text: "Magic sets"
  end

  test "should create magic set" do
    visit magic_sets_url
    click_on "New magic set"

    fill_in "Code", with: @magic_set.code
    fill_in "Name", with: @magic_set.name
    click_on "Create Magic set"

    assert_text "Magic set was successfully created"
    click_on "Back"
  end

  test "should update Magic set" do
    visit magic_set_url(@magic_set)
    click_on "Edit this magic set", match: :first

    fill_in "Code", with: @magic_set.code
    fill_in "Name", with: @magic_set.name
    click_on "Update Magic set"

    assert_text "Magic set was successfully updated"
    click_on "Back"
  end

  test "should destroy Magic set" do
    visit magic_set_url(@magic_set)
    click_on "Destroy this magic set", match: :first

    assert_text "Magic set was successfully destroyed"
  end
end
