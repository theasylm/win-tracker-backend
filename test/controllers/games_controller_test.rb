require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { commander_id: @game.commander_id, deck_id: @game.deck_id, first: @game.first, format_id: @game.format_id, mulls: @game.mulls, notes: @game.notes, opponentMulls: @game.opponentMulls, opponent_id: @game.opponent_id, opposing_commander_id: @game.opposing_commander_id, player_id: @game.player_id, set_id: @game.set_id, win: @game.win } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { commander_id: @game.commander_id, deck_id: @game.deck_id, first: @game.first, format_id: @game.format_id, mulls: @game.mulls, notes: @game.notes, opponentMulls: @game.opponentMulls, opponent_id: @game.opponent_id, opposing_commander_id: @game.opposing_commander_id, player_id: @game.player_id, set_id: @game.set_id, win: @game.win } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
