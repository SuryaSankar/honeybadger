class UniversityCourse < ActiveRecord::Base
	belongs_to :university	#EC321 belongs to NIT Trichy
	belongs_to :course	#EC321 belongs to Analog electronic circuits
	has_many :qpapers	
	has_many :program_university_courses	#EC321 has 1.EC321 in B-Tech ECE, 2. EC321 in B-Tech EEE, 3. EC321 in B-Tech ICE
	has_many :programs, through: :program_university_courses  #EC321 has B-Tech ECE, B-Tech EEE, M-Tech ICE
	has_many :units
	validates_uniqueness_of :course_code, scope: [:university_id]
	accepts_nested_attributes_for :course,  reject_if: proc { |attributes| attributes['name'].blank?  }
	accepts_nested_attributes_for :units,  reject_if: proc { |attributes| attributes['unit_curriculum'].blank?  }

	def full_course_name
		self.course_code + "-" + self.course.name 
	end
end
