class MoversController < ApplicationController
  before_action :set_mover, only: [:show, :edit, :update, :destroy]

  # GET /movers
  # GET /movers.json
  def index
    @movers = Mover.all
  end

  def update_from_feed 
    call_rake :update_movers, :feed_url => params[:feed_url]
    # system "rake update_stock_quotes FEED_URL=#{params[:feed_url]} &"
    flash[:notice] = "Updating quotes"
    redirect_to root_url
  end

  # GET /movers/1
  # GET /movers/1.json
  def show
  end

  # GET /movers/new
  def new
    @mover = Mover.new
  end

  # GET /movers/1/edit
  def edit
  end

  # POST /movers
  # POST /movers.json
  def create
    @mover = Mover.new(mover_params)

    respond_to do |format|
      if @mover.save
        format.html { redirect_to @mover, notice: 'Mover was successfully created.' }
        format.json { render :show, status: :created, location: @mover }
      else
        format.html { render :new }
        format.json { render json: @mover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movers/1
  # PATCH/PUT /movers/1.json
  def update
    respond_to do |format|
      if @mover.update(mover_params)
        format.html { redirect_to @mover, notice: 'Mover was successfully updated.' }
        format.json { render :show, status: :ok, location: @mover }
      else
        format.html { render :edit }
        format.json { render json: @mover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movers/1
  # DELETE /movers/1.json
  def destroy
    @mover.destroy
    respond_to do |format|
      format.html { redirect_to movers_url, notice: 'Mover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mover
      @mover = Mover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mover_params
      params.require(:mover).permit(:mover, :volume)
    end
end
