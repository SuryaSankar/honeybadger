class UniversityCoursesController < ApplicationController
  before_action :set_university_course, only: [:show, :edit, :update, :destroy, :new_qpaper]
  before_filter :authenticate_admin!, except: [:index, :show]
  # GET /university_courses
  # GET /university_courses.json
  def index
    @university_courses = UniversityCourse.all
  end

  # GET /university_courses/1
  # GET /university_courses/1.json
  def show
  end

  # GET /university_courses/new
  def new
    @university_course = UniversityCourse.new
  end

  def new_qpaper
	@qpaper = @university_course.qpapers.build
	@qpaper.examquestions.build.build_question
	render "qpapers/new"
  end

  def create_qpaper
    @qpaper = Qpaper.new(qpaper_params)  
    @qpaper.user_id = current_user.id
    @qpaper.examquestions.each do |eq|
	 eq.user_id = current_user.id
	 eq.question.user_id ||= current_user.id
	 eq.question.course_id ||= UniversityCourse.find(@qpaper.university_course_id).course_id
    end
    respond_to do |format|
      if @qpaper.save!
        format.html { redirect_to @qpaper, notice: 'Question paper was successfully created.' }
        format.json { render action: 'qpapers/show', status: :created, location: @qpaper }
      else
        format.html { render action: 'qpapers/new' }
        format.json { render json: @qpaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /university_courses/1/edit
  def edit
  end

  # POST /university_courses
  # POST /university_courses.json
  def create
    @university_course = UniversityCourse.new(university_course_params)

    respond_to do |format|
      if @university_course.save
        format.html { redirect_to @university_course, notice: 'University course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @university_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @university_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /university_courses/1
  # PATCH/PUT /university_courses/1.json
  def update
    respond_to do |format|
      if @university_course.update(university_course_params)
        format.html { redirect_to @university_course, notice: 'University course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @university_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /university_courses/1
  # DELETE /university_courses/1.json
  def destroy
    @university_course.destroy
    respond_to do |format|
      format.html { redirect_to university_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university_course
      @university_course = UniversityCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_course_params
      params.require(:university_course).permit(:university_id, :course_id, :course_code)
    end

    def qpaper_params
      params.require(:qpaper).permit(:year, :title, :exam_name,  :official, :university_course_id, :program_ids, :month, :semester,  examquestions_attributes: [:mark, :qnumber, :id, :question_id,:subquestion_no,  {question_attributes: [:qtext, :qdesc, :id]}])
    end

end
