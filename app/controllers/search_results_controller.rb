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
		render partial: "partials/home_search_form/stage3", locals: { courses: ProgramUniversityCourse.where( program_id: program_semester_params[:program_id], semester: program_semester_params[:semester]) }
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
end
