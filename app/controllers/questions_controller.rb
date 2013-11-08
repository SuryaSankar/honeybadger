class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :find]
  #before_action :authorize, except: [:index, :show]
  # before_filter :admin_user, only: [:new, :edit, :create, :update, :destroy]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
	if params[:qpaperid] then
		@qpaper=Qpaper.find params[:qpaperid]
	end
	if params[:puc] && params[:puc]!="nil" then
		@puc=ProgramUniversityCourse.find(params[:puc])
	end
	@show_left_navigation = false
	@solution = Solution.new
  end

  # GET /questions/new
  def new
    @question = Question.new
    if params[:course] then
	@question.course = Course.find(params[:course])
    end
  end

  # GET /questions/1/edit
  def edit
	@show_left_navigation = false
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id=current_user.id
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def yourquestions
	@questions=Question.where(user_id: current_user.id)
	render "index"
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def submit_answer
	@solution=Solution.new solution_params
	@solution.user_id=current_user.id
	@solution.question_id= params[:question_id]
	@question = Question.find(params[:question_id])
	if @solution.save! then
		redirect_to question_path(params[:question_id])
	else
		render action: 'show', location: Question.find(params[:question_id])
	end		
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:qtext,:qtitle, :course_id, :topic_id, :standalone)
    end

    def solution_params
	params.require(:solution).permit(:id,:answer,:question_id)
    end
end
