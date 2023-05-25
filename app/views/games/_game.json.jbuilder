json.gameFormat game.format.name
json.set game.magic_set.nil? ? '' : game.magic_set.name + ' - ' + game.magic_set.code
json.player game.player.name
json.opponent game.opponent.name
json.commander game.commander.nil? ? '' : game.commander.name
json.opposingCommander game.opposing_commander.nil? ? '' : game.opposing_commander.name
json.mulls game.mulls
json.opponentMulls game.opponent_mulls
json.first game.first
json.win game.win
json.deckName game.deck.name
json.notes game.notes
json.date game.date