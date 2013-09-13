class University < ActiveRecord::Base
	has_many :programs
	has_many :branches, through: :programs
	has_many :institutions
	has_many :users
	has_many :university_courses
	has_many :courses, through: :university_courses

	def short
		short_name.nil? ? name : short_name
	end
end
