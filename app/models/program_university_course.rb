class ProgramUniversityCourse < ActiveRecord::Base
	belongs_to :university_course, touch: true
	belongs_to :program, touch: true
	accepts_nested_attributes_for :university_course,  reject_if: proc { |attributes| attributes['course_code'].blank?  }
	validates_uniqueness_of :university_course_id, scope: [:program_id]

	def full_course_name
		self.university_course.full_course_name
	end
end
