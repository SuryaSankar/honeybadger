class QpapersController < ApplicationController
  before_action :set_qpaper, only: [:show, :edit, :update, :destroy]

  # GET /qpapers
  # GET /qpapers.json
  def index
    @qpapers = Qpaper.all
  end

  # GET /qpapers/1
  # GET /qpapers/1.json
  def show
  end

  # GET /qpapers/new
  def new
    @qpaper = Qpaper.new
  end

  # GET /qpapers/1/edit
  def edit
  end

  # POST /qpapers
  # POST /qpapers.json
  def create
    @qpaper = Qpaper.new(qpaper_params)

    respond_to do |format|
      if @qpaper.save
        format.html { redirect_to @qpaper, notice: 'Qpaper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qpaper }
      else
        format.html { render action: 'new' }
        format.json { render json: @qpaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qpapers/1
  # PATCH/PUT /qpapers/1.json
  def update
    respond_to do |format|
      if @qpaper.update(qpaper_params)
        format.html { redirect_to @qpaper, notice: 'Qpaper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @qpaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qpapers/1
  # DELETE /qpapers/1.json
  def destroy
    @qpaper.destroy
    respond_to do |format|
      format.html { redirect_to qpapers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qpaper
      @qpaper = Qpaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qpaper_params
      params.require(:qpaper).permit(:year, :institution, :course_id)
    end
end
