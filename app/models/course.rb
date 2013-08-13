class Course < ActiveRecord::Base
	has_many :qpapers
	has_many :programs, through :program_courses
end
