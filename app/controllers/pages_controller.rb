class PagesController < ApplicationController
	def home
		@show_branches_accordion=false
		@home_json=University.select([:id, :name]).includes(:branches, :programs => [:program_university_courses => { :university_course => :course }]).load.map{|u| {:label => u.name, :children => u.programs.to_a.map{ |p| { :label => p.shorter_desc , :children => (1..8).map{|x| { :label => "Semester "+x.to_s, :children => p.program_university_courses.select{ |puc| puc.semester==x && puc.university_course !=nil }.map{ |puc1| { :label => view_context.link_to(puc1.university_course.full_course_name, university_course_path(puc1.university_course_id) ) } }  }} }} }}
		
		render layout: "home_layout"
	end

	def about
	end

	def channel
	end
	
end
