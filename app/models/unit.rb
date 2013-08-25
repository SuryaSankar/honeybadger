class Unit < ActiveRecord::Base
	belongs_to :university_course
	validates_uniqueness_of :unit_number, scope: [:university_course_id]
end
