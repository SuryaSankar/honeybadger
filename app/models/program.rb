class Program < ActiveRecord::Base
	has_many :program_university_courses
	has_many :university_courses, through: :program_university_courses
	has_many :users
	belongs_to :university
	belongs_to :branch
end
