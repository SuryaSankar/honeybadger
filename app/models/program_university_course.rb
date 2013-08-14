class ProgramUniversityCourse < ActiveRecord::Base
	belongs_to :university_course
	belongs_to :program
end
