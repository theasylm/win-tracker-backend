class MagicSetsController < ApplicationController
  before_action :set_magic_set, only: %i[ show edit update destroy ]

  # GET /magic_sets or /magic_sets.json
  def index
    @magic_sets = MagicSet.all.order(:name)
  end

  # GET /magic_sets/1 or /magic_sets/1.json
  def show
  end

  # GET /magic_sets/new
  def new
    @magic_set = MagicSet.new
  end

  # GET /magic_sets/1/edit
  def edit
  end

  # POST /magic_sets or /magic_sets.json
  def create
    @magic_set = MagicSet.new(magic_set_params)

    respond_to do |format|
      if @magic_set.save
        format.html { redirect_to magic_set_url(@magic_set), notice: "Magic set was successfully created." }
        format.json { render :show, status: :created, location: @magic_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @magic_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_sets/1 or /magic_sets/1.json
  def update
    respond_to do |format|
      if @magic_set.update(magic_set_params)
        format.html { redirect_to magic_set_url(@magic_set), notice: "Magic set was successfully updated." }
        format.json { render :show, status: :ok, location: @magic_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @magic_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_sets/1 or /magic_sets/1.json
  def destroy
    @magic_set.destroy

    respond_to do |format|
      format.html { redirect_to magic_sets_url, notice: "Magic set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_set
      @magic_set = MagicSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def magic_set_params
      params.require(:magic_set).permit(:name, :code)
    end
end
