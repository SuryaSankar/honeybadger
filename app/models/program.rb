class Program < ActiveRecord::Base
	has_many :program_university_courses
	has_many :university_courses, through: :program_university_courses
	has_many :users
	belongs_to :university
	belongs_to :branch
	
	def degree_short
		case self.degree_name
			when 'Bachelor of Engineering'
				return 'B.E'
			when 'Bachelor of Technology'
				return 'B.Tech'
			else
				return nil
		end
	end

	def short_desc
		degree_short + " in " + self.branch.abbreviation + " from " + self.university.name
	end
end
