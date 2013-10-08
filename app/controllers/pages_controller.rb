class PagesController < ApplicationController
	def home
		@show_branches_accordion=false
		render layout: "home_layout"
	end

	def about
	end

	def channel
	end
	
end
