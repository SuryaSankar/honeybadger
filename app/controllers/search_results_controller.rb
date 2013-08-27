class SearchResultsController < ApplicationController

	def search
	    @qpapers=UniversityCourse.find(search_params[:university_course]).qpapers
	    puts search_params[:commit]
	    render "qpapers/index"
	end

	def find_programs_from_university_and_branch		
		@programs=Program.where university_id: university_branch_params[:university_id], branch_id: university_branch_params[:branch_id]
		render partial: "partials/home_search_form/stage2", locals: {programs: @programs}
	end

	def find_courses_from_program_and_semester
		puts "inside find_courses_from_program_and_semester"
		puts program_semester_params
		@pucs=ProgramUniversityCourse.includes(:university_course).where( program_id: program_semester_params[:program_id], semester: program_semester_params[:semester])
		puts @pucs
		render partial: "partials/home_search_form/stage3", locals: { prog_univ_courses: @pucs }
	end

	def get_course
		@university_course=UniversityCourse.includes(:program_university_courses, :programs, :qpapers, :units, :course).find(get_course_params[:university_course_id])
		render "university_courses/show"
	end

	private
		def search_params
			params.permit(:program, :university_id, :university_course, :commit, :controller, :action)
		end

		def university_branch_params
			params.permit(:branch_id, :university_id, :commit, :controller, :action)
		end

		def program_semester_params
			params.permit(:program_id, :semester, :commit, :controller, :action)
		end
		def get_course_params
			params.permit(:university_course_id, :commit, :controller, :action)
		end
end
