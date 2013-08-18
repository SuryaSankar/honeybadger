class SearchResultsController < ApplicationController

	def search
	    @qpapers=UniversityCourse.find(search_params[:university_course]).qpapers
	    puts search_params[:commit]
	    render "qpapers/index"
	end

	private
		def search_params
			params.permit(:program, :university, :university_course, :commit, :controller, :action)
		end
end
