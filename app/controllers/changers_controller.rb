class ChangersController < ApplicationController
  before_action :set_changer, only: [:show, :edit, :update, :destroy]

  # GET /changers
  # GET /changers.json
  def index
    @changers = Changer.all
  end

  # GET /changers/1
  # GET /changers/1.json
  def show
  end

  # GET /changers/new
  def new
    @changer = Changer.new
  end

  # GET /changers/1/edit
  def edit
  end

  # POST /changers
  # POST /changers.json
  def create
    @changer = Changer.new(changer_params)

    respond_to do |format|
      if @changer.save
        format.html { redirect_to @changer, notice: 'Changer was successfully created.' }
        format.json { render :show, status: :created, location: @changer }
      else
        format.html { render :new }
        format.json { render json: @changer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changers/1
  # PATCH/PUT /changers/1.json
  def update
    respond_to do |format|
      if @changer.update(changer_params)
        format.html { redirect_to @changer, notice: 'Changer was successfully updated.' }
        format.json { render :show, status: :ok, location: @changer }
      else
        format.html { render :edit }
        format.json { render json: @changer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changers/1
  # DELETE /changers/1.json
  def destroy
    @changer.destroy
    respond_to do |format|
      format.html { redirect_to changers_url, notice: 'Changer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_changer
      @changer = Changer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def changer_params
      params.require(:changer).permit(:security, :price, :percentage_change)
    end
end
