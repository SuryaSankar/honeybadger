class ProgramUniversityCoursesController < ApplicationController
  before_action :set_program_university_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, except: [:index, :show]
  # GET /program_university_courses
  # GET /program_university_courses.json
  def index
    @program_university_courses = ProgramUniversityCourse.all
  end

  # GET /program_university_courses/1
  # GET /program_university_courses/1.json
  def show
  end

  # GET /program_university_courses/new
  def new
    @program_university_course = ProgramUniversityCourse.new
  end

  # GET /program_university_courses/1/edit
  def edit
  end

  # POST /program_university_courses
  # POST /program_university_courses.json
  def create
    @program_university_course = ProgramUniversityCourse.new(program_university_course_params)

    respond_to do |format|
      if @program_university_course.save
        format.html { redirect_to @program_university_course, notice: 'Program university course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program_university_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @program_university_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_university_courses/1
  # PATCH/PUT /program_university_courses/1.json
  def update
    respond_to do |format|
      if @program_university_course.update(program_university_course_params)
        format.html { redirect_to @program_university_course, notice: 'Program university course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program_university_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_university_courses/1
  # DELETE /program_university_courses/1.json
  def destroy
    @program_university_course.destroy
    respond_to do |format|
      format.html { redirect_to program_university_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_university_course
      @program_university_course = ProgramUniversityCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_university_course_params
      params.require(:program_university_course).permit(:program_id, :university_course_id, :semester, :elective )
    end
end
