class ExamquestionsController < ApplicationController
  before_action :set_examquestion, only: [:show, :edit, :update, :destroy]
  #before_filter :admin_user, only: [:new, :edit, :create, :update, :destroy]
  # GET /examquestions
  # GET /examquestions.json
  def index
    @examquestions = Examquestion.all
  end

  # GET /examquestions/1
  # GET /examquestions/1.json
  def show
  end

  # GET /examquestions/new
  def new
    @examquestion = Examquestion.new.tap { |e| e.build_question }
  end

  # GET /examquestions/1/edit
  def edit
  end

  # POST /examquestions
  # POST /examquestions.json
  def create
    @examquestion = Examquestion.new(examquestion_params)

    respond_to do |format|
      if @examquestion.save
        format.html { redirect_to @examquestion, notice: 'Examquestion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @examquestion }
      else
        format.html { render action: 'new' }
        format.json { render json: @examquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examquestions/1
  # PATCH/PUT /examquestions/1.json
  def update
    respond_to do |format|
      if @examquestion.update(examquestion_params)
        format.html { redirect_to @examquestion, notice: 'Examquestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @examquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examquestions/1
  # DELETE /examquestions/1.json
  def destroy
    @examquestion.destroy
    respond_to do |format|
      format.html { redirect_to examquestions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examquestion
      @examquestion = Examquestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def examquestion_params
      params.require(:examquestion).permit(:qpaper_id, :mark, :qnumber, :question_id, :subquestion_no,  {question_attributes: [:qtext, :qdesc, :id]})
    end
end
