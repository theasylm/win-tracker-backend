require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Commander", with: @game.commander_id
    fill_in "Deck", with: @game.deck_id
    check "First" if @game.first
    fill_in "Format", with: @game.format_id
    fill_in "Mulls", with: @game.mulls
    fill_in "Notes", with: @game.notes
    fill_in "Opponentmulls", with: @game.opponentMulls
    fill_in "Opponent", with: @game.opponent_id
    fill_in "Opposing commander", with: @game.opposing_commander_id
    fill_in "Player", with: @game.player_id
    fill_in "Set", with: @game.set_id
    check "Win" if @game.win
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Commander", with: @game.commander_id
    fill_in "Deck", with: @game.deck_id
    check "First" if @game.first
    fill_in "Format", with: @game.format_id
    fill_in "Mulls", with: @game.mulls
    fill_in "Notes", with: @game.notes
    fill_in "Opponentmulls", with: @game.opponentMulls
    fill_in "Opponent", with: @game.opponent_id
    fill_in "Opposing commander", with: @game.opposing_commander_id
    fill_in "Player", with: @game.player_id
    fill_in "Set", with: @game.set_id
    check "Win" if @game.win
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
