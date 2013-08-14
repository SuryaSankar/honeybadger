class Department < ActiveRecord::Base
	belongs_to :institution
	belongs_to :branch
end
