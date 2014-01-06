class PagesController < ApplicationController

	def home
		@show_branches_accordion=false
		@feedback=Feedback.new		
		render layout: false
	end

  def home2
		render layout: false
  end

	def about
		#@show_branches_accordion=false	
		#render layout: false
	end

	def channel
	end
	
end

