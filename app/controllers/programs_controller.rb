class ProgramsController < ApplicationController
  before_action :set_program, only: [ :edit, :update, :destroy]
  before_filter :authenticate_admin!, except: [:index, :show, :json_list, :schedule, :select_program]
  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
	eager_load_program
  end

  def schedule
    @program=Program.find(params[:program])
    @exams=Exam.where( university_course_id: ProgramUniversityCourse.select(:university_course_id).where(program_id: @program.id,semester: params[:semester] )).order(:date)
  end

  def json_list
	render json: University.select([:id, :name]).includes(:branches, :programs => [:program_university_courses => { :university_course => :course }]).load.map{|u| {"label" => u.name, "children" => u.programs.to_a.map{ |p| {"label" => p.shorter_desc , "children" => (1..8).map{|x| { "label" => "Semester "+x.to_s, "children" => p.program_university_courses.select{ |puc| puc.semester==x && puc.university_course !=nil }.map{ |puc1| { "label"=> puc1.university_course.full_course_name } }  }} }} }}.to_json
  end

  # GET /programs/new
  def new
    @program = Program.new
    @program.program_university_courses.build.build_university_course.tap{|uc| 5.times { uc.units.build } }.build_course
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)
    @program.program_university_courses.each { |puc| puc.university_course.university_id = @program.university_id }
    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  def select_program
    @program=Program.find(params[:program_choice])
    render partial: "program_details", locals: {p: @program}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    def eager_load_program
      @program = Program.includes(program_university_courses: {university_course: :course }).find(params[:id])
    end
    def schedule_params
      params.permit(:semester, :program)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:degree_name, :branch_id, :university_id, program_university_courses_attributes: [:semester, :elective, :credits , :university_course_id, :id,  { university_course_attributes: [:id, :course_code, :university_id, :course_id , { course_attributes: [:id, :name, :practical, :branch_id]}, units_attributes: [:id, :unit_number, :name,  :unit_curriculum ] ] }])
    end
end
