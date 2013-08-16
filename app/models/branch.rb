class Branch < ActiveRecord::Base
	has_many :programs
	has_many :universities, through: :programs
	has_many :courses
	has_many :departments
	
	def abbreviation
		case self.name
			when 'Production Engineering'
				"Prod"
			when 'Civil Engineering'
				"Civil"
			when 'Chemical Engineering'
				"Chem"
			else
				(self.name.scan /\p{Upper}/).join
		end
	end
end
