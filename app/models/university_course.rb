class UniversityCourse < ActiveRecord::Base
	belongs_to :university, touch: true	
	belongs_to :course, touch: true	
	has_many :qpapers, after_remove: proc{ |a| a.touch }
	has_many :program_university_courses, dependent: :destroy	
	has_many :programs, through: :program_university_courses
	has_many :units
	has_and_belongs_to_many :outdated_courses, class_name: "UniversityCourse", foreign_key: "updated_course_id", join_table: "outdated_courses_updated_courses", association_foreign_key: "outdated_course_id", uniq: true
	has_and_belongs_to_many :updated_courses, class_name: "UniversityCourse", foreign_key: "outdated_course_id", join_table: "outdated_courses_updated_courses", association_foreign_key: "updated_course_id", uniq: true	
	validates_uniqueness_of :course_code, scope: [:university_id]
	accepts_nested_attributes_for :course,  reject_if: proc { |attributes| attributes['name'].blank?  }
	accepts_nested_attributes_for :units,  reject_if: proc { |attributes| attributes['unit_curriculum'].blank?  }

	def full_course_name
		self.course_code + "-" + self.course.name 
	end
end
