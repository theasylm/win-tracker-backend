class CommandersController < ApplicationController
  before_action :set_commander, only: %i[ show edit update destroy ]

  # GET /commanders or /commanders.json
  def index
    @commanders = Commander.all.order(:name)
  end

  # GET /commanders/1 or /commanders/1.json
  def show
  end

  # GET /commanders/new
  def new
    @commander = Commander.new
  end

  # GET /commanders/1/edit
  def edit
  end

  # POST /commanders or /commanders.json
  def create
    @commander = Commander.new(commander_params)

    respond_to do |format|
      if @commander.save
        format.html { redirect_to commander_url(@commander), notice: "Commander was successfully created." }
        format.json { render :show, status: :created, location: @commander }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commander.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commanders/1 or /commanders/1.json
  def update
    respond_to do |format|
      if @commander.update(commander_params)
        format.html { redirect_to commander_url(@commander), notice: "Commander was successfully updated." }
        format.json { render :show, status: :ok, location: @commander }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commander.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commanders/1 or /commanders/1.json
  def destroy
    @commander.destroy

    respond_to do |format|
      format.html { redirect_to commanders_url, notice: "Commander was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commander
      @commander = Commander.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commander_params
      params.require(:commander).permit(:name)
    end
end
