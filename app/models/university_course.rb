class UniversityCourse < ActiveRecord::Base
	belongs_to :university	#EC321 belongs to NIT Trichy
	belongs_to :course	#EC321 belongs to Analog electronic circuits
	has_many :qpapers	
	has_many :program_university_courses	#EC321 has 1.EC321 in B-Tech ECE, 2. EC321 in B-Tech EEE, 3. EC321 in B-Tech ICE
	has_many :programs, through: :program_university_courses  #EC321 has B-Tech ECE, B-Tech EEE, M-Tech ICE
end
