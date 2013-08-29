class Course < ActiveRecord::Base
	belongs_to :branch
	has_many :university_courses
	has_many :universities, through: :university_courses
	has_many :qpapers, through: :university_courses
	has_many :cheatsheets
	has_many :units
	has_many :programs, through: :university_courses
	has_many :program_university_courses, through: :university_courses
	has_many :questions

	validates_uniqueness_of :name
end
