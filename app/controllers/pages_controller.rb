class PagesController < ApplicationController

	def home
		@show_branches_accordion=false
		@home_json=University.select([:id, :name]).includes(:branches, :programs => [:program_university_courses => { :university_course => :course }]).load.map{|u| {	"data" => u.name, 
	"state" => "open", 
	"children" => u.programs.to_a.map{ |p| { 
			"data" => p.shorter_desc , 
			"children" => (1..8).map{|x| { "data" => "Semester "+x.to_s, 
							"children" => p.program_university_courses.select{ |puc| puc.semester==x && puc.university_course !=nil }.map{ |puc1| { 
								"attr"=> { "rel" => "leaf" } ,"data" => { "title" => puc1.university_course.full_course_name, "attr" => { "href" => program_university_course_path(puc1.id) } }
 } }  }} }} }}
		
		render layout: false
	end

	def about
	end

	def channel
	end
	
end

