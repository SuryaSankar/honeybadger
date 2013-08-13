class Department < ActiveRecord::Base
	has_many :programs
	belongs_to :institution
	belongs_to :branch
end
