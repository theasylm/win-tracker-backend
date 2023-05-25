class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_from_raw
    parms = raw_params

    game_format = Format.find_by(name: parms[:gameFormat])
    if game_format.nil? 
      game_format = Format.new
      game_format.name = parms[:format]
      game_format.save
    end

    set = nil
    unless parms[:set] == ''
      match = /(.+) - ([A-Z]{3})/.match(parms[:set])
      name = match[1]
      code = match[2]
      set = MagicSet.find_by(code: code)
      if set.nil?
        set = MagicSet.new
        set.name = name
        set.code = code
        set.save
      end
    end

    player = Player.find_by(name: parms[:player])
    if player.nil?
      player = Player.new
      player.name = parms[:player]
      player.save
    end

    opponent = Player.find_by(name: parms[:opponent])
    if opponent.nil?
      opponent = Player.new
      opponent.name = parms[:opponent]
      opponent.save
    end

    commander = nil
    unless parms[:commander] == ''
      commander = Commander.find_by(name: parms[:commander])
      if commander.nil?
        commander = Commander.new
        commander.name = parms[:commander]
        commander.save
      end
    end

    opposing_commander = nil
    unless parms[:opposingCommander] == ''
      opposing_commander = Commander.find_by(name: parms[:opposingCommander])
      if opposing_commander.nil?
        opposing_commander = Commander.new
        opposing_commander.name = parms[:opposingCommander]
        opposing_commander.save
      end
    end

    deck = Deck.find_by(name: parms[:deckName])
    if deck.nil?
      deck = Deck.new
      deck.name = parms[:deckName]
      deck.save
    end

    game = Game.new
    game.format_id = game_format.id
    game.magic_set = set
    game.player = player
    game.opponent = opponent
    game.commander = commander
    game.opposing_commander = opposing_commander
    game.deck = deck
    game.mulls = parms[:mulls]
    game.opponent_mulls = parms[:opponentMulls]
    game.first = parms[:first]
    game.win = parms[:win]
    game.notes = parms[:notes]
    game.date = DateTime.parse(parms[:date])

    respond_to do |format|
      if game.save
        format.html { redirect_to game_url(game), notice: "Game was successfully created." }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: game.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:format_id, :magic_set_id, :player_id, :opponent_id, :commander_id, :opposing_commander_id, :mulls, :opponent_mulls, :win, :first, :deck_id, :notes)
    end

    def raw_params
      params.permit(:gameFormat, :set, :player, :opponent, :commander, :opposingCommander, :mulls, :opponentMulls, :win, :first, :deckName, :notes, :date)
    end
end
