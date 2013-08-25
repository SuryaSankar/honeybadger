class ProgramUniversityCourse < ActiveRecord::Base
	belongs_to :university_course
	belongs_to :program
	accepts_nested_attributes_for :university_course,  reject_if: proc { |attributes| attributes['course_code'].blank?  }
end
