class FormatsController < ApplicationController
  before_action :set_format, only: %i[ show edit update destroy ]

  # GET /formats or /formats.json
  def index
    @formats = Format.all
  end

  # GET /formats/1 or /formats/1.json
  def show
  end

  # GET /formats/new
  def new
    @format = Format.new
  end

  # GET /formats/1/edit
  def edit
  end

  # POST /formats or /formats.json
  def create
    @format = Format.new(format_params)

    respond_to do |format|
      if @format.save
        format.html { redirect_to format_url(@format), notice: "Format was successfully created." }
        format.json { render :show, status: :created, location: @format }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formats/1 or /formats/1.json
  def update
    respond_to do |format|
      if @format.update(format_params)
        format.html { redirect_to format_url(@format), notice: "Format was successfully updated." }
        format.json { render :show, status: :ok, location: @format }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formats/1 or /formats/1.json
  def destroy
    @format.destroy

    respond_to do |format|
      format.html { redirect_to formats_url, notice: "Format was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_format
      @format = Format.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def format_params
      params.require(:format).permit(:name)
    end
end
