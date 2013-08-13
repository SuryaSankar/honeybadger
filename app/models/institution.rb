class Institution < ActiveRecord::Base
	belongs_to :university
	has_many :departments
	has_many :branches, through :departments
end
