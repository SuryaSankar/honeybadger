class Program < ActiveRecord::Base
	has_many :courses, through :program_courses
	belongs_to :university
	belongs_to :branch
end
