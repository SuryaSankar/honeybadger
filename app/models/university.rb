class University < ActiveRecord::Base
	has_many :branches
	has_many :programs
	has_many :institutions
	has_many :users
end
