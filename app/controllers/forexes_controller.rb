class ForexesController < ApplicationController
  before_action :set_forex, only: [:show, :edit, :update, :destroy]

  # GET /forexes
  # GET /forexes.json
  def index
    @forexes = Forex.all
  end

  # GET /forexes/1
  # GET /forexes/1.json
  def show
  end

  # GET /forexes/new
  def new
    @forex = Forex.new
  end

  # GET /forexes/1/edit
  def edit
  end

  # POST /forexes
  # POST /forexes.json
  def create
    @forex = Forex.new(forex_params)

    respond_to do |format|
      if @forex.save
        format.html { redirect_to @forex, notice: 'Forex was successfully created.' }
        format.json { render :show, status: :created, location: @forex }
      else
        format.html { render :new }
        format.json { render json: @forex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forexes/1
  # PATCH/PUT /forexes/1.json
  def update
    respond_to do |format|
      if @forex.update(forex_params)
        format.html { redirect_to @forex, notice: 'Forex was successfully updated.' }
        format.json { render :show, status: :ok, location: @forex }
      else
        format.html { render :edit }
        format.json { render json: @forex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forexes/1
  # DELETE /forexes/1.json
  def destroy
    @forex.destroy
    respond_to do |format|
      format.html { redirect_to forexes_url, notice: 'Forex was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forex
      @forex = Forex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forex_params
      params.require(:forex).permit(:currency, :buy, :sell, :mean)
    end
end
