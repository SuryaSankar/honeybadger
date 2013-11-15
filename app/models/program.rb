class Program < ActiveRecord::Base
	has_many :program_university_courses
	has_many :university_courses, through: :program_university_courses
	has_many :users
	belongs_to :university, touch: true
	belongs_to :branch
	has_and_belongs_to_many :qpapers

	validates_uniqueness_of :degree_name, scope: [:university_id, :branch_id]
	accepts_nested_attributes_for :program_university_courses,  reject_if: proc { |attributes| attributes['semester'].blank?  }
 
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
		degree_short + " - " + self.branch.abbreviation + " - " + self.university.name
	end

	def shorter_desc
		degree_short + " - " + self.branch.name
	end
end
