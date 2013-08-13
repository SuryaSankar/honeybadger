class Branch < ActiveRecord::Base
	has_many :universities
	has_many :programs
end
