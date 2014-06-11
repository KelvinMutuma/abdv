class ShareIndicesController < ApplicationController
  before_action :set_share_index, only: [:show, :edit, :update, :destroy]

  # GET /share_indices
  # GET /share_indices.json
  def index
    @share_indices = ShareIndex.all
  end

  # GET /share_indices/1
  # GET /share_indices/1.json
  def show
  end

  # GET /share_indices/new
  def new
    @share_index = ShareIndex.new
  end

  # GET /share_indices/1/edit
  def edit
  end

  # POST /share_indices
  # POST /share_indices.json
  def create
    @share_index = ShareIndex.new(share_index_params)

    respond_to do |format|
      if @share_index.save
        format.html { redirect_to @share_index, notice: 'Share index was successfully created.' }
        format.json { render :show, status: :created, location: @share_index }
      else
        format.html { render :new }
        format.json { render json: @share_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_indices/1
  # PATCH/PUT /share_indices/1.json
  def update
    respond_to do |format|
      if @share_index.update(share_index_params)
        format.html { redirect_to @share_index, notice: 'Share index was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_index }
      else
        format.html { render :edit }
        format.json { render json: @share_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_indices/1
  # DELETE /share_indices/1.json
  def destroy
    @share_index.destroy
    respond_to do |format|
      format.html { redirect_to share_indices_url, notice: 'Share index was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_index
      @share_index = ShareIndex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_index_params
      params.require(:share_index).permit(:all_share_index, :twenty_share_index)
    end
end
