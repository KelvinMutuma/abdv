class StockQuotesController < ApplicationController
  before_action :set_stock_quote, only: [:show, :edit, :update, :destroy]

  before_filter :get_security

  # GET /stock_quotes
  # GET /stock_quotes.json
  def index
    @stock_quotes = @security.stock_quotes
    @share_indices = ShareIndex.all
    @markets = Market.all
  end

  def update_from_feed 
    call_rake :update_stock_quotes, :feed_url => params[:feed_url]
    # system "rake update_stock_quotes FEED_URL=#{params[:feed_url]} &"
    flash[:notice] = "Updating Movers"
    redirect_to root_url
  end
  # GET /stock_quotes/1
  # GET /stock_quotes/1.json
  def show
  end

  # GET /stock_quotes/new
  def new
    @stock_quote = StockQuote.new
  end

  # GET /stock_quotes/1/edit
  def edit
  end

  # POST /stock_quotes
  # POST /stock_quotes.json
  def create
    @stock_quote = @security.stock_quotes.new(stock_quote_params)

    respond_to do |format|
      if @stock_quote.save
        format.html { redirect_to [@security, @stock_quote], notice: 'Stock quote was successfully created.' }
        format.json { render :show, status: :created, location: @stock_quote }
      else
        format.html { render :new }
        format.json { render json: @stock_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_quotes/1
  # PATCH/PUT /stock_quotes/1.json
  def update
    respond_to do |format|
      if @stock_quote.update(stock_quote_params)
        format.html { redirect_to [@security, @stock_quote], notice: 'Stock quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_quote }
      else
        format.html { render :edit }
        format.json { render json: @stock_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_quotes/1
  # DELETE /stock_quotes/1.json
  def destroy
    @stock_quote.destroy
    respond_to do |format|
      format.html { redirect_to stock_quotes_url, notice: 'Stock quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_security
    @security = Security.find(params[:security_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_quote
      @stock_quote = StockQuote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_quote_params
      params.require(:stock_quote).permit(:security_id)
    end
end
