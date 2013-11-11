class PagesController < ApplicationController

	def home
		@show_branches_accordion=false
		@feedback=Feedback.new		
		render layout: false
	end

	def about
	end

	def channel
	end
	
end

