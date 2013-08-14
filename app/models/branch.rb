class Branch < ActiveRecord::Base
	has_many :programs
	has_many :universities, through: :programs
	has_many :courses
	has_many :departments
	
end
