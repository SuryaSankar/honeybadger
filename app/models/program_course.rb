class ProgramCourse < ActiveRecord::Base
	belongs_to :program
	belongs_to :course
end
