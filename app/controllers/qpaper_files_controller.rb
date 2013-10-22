class QpaperFilesController < ApplicationController
  before_action :set_qpaper_file, only: [:show, :edit, :update, :destroy]

  # GET /qpaper_files
  # GET /qpaper_files.json
  def index
    @qpaper_files = QpaperFile.all
  end

  # GET /qpaper_files/1
  # GET /qpaper_files/1.json
  def show
  end

  # GET /qpaper_files/new
  def new
    @qpaper_file = QpaperFile.new
  end

  # GET /qpaper_files/1/edit
  def edit
  end

  # POST /qpaper_files
  # POST /qpaper_files.json
  def create
    @qpaper_file = QpaperFile.new(qpaper_file_params)
    @qpaper_file.user_id = current_user.id
    respond_to do |format|
      if @qpaper_file.save
        format.html { redirect_to @qpaper_file, notice: 'Qpaper file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qpaper_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @qpaper_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qpaper_files/1
  # PATCH/PUT /qpaper_files/1.json
  def update
    respond_to do |format|
      if @qpaper_file.update(qpaper_file_params)
        format.html { redirect_to @qpaper_file, notice: 'Qpaper file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @qpaper_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qpaper_files/1
  # DELETE /qpaper_files/1.json
  def destroy
    @qpaper_file.destroy
    respond_to do |format|
      format.html { redirect_to qpaper_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qpaper_file
      @qpaper_file = QpaperFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qpaper_file_params
      params.require(:qpaper_file).permit(:user_id, :university_course_id, :uploaded_file)
    end
end
