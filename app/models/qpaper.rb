class Qpaper < ActiveRecord::Base
        has_many :examquestions , dependent: :destroy
	has_many :questions, through: :examquestions
	belongs_to :university_course, touch: true
	belongs_to :user
	has_and_belongs_to_many :programs

	accepts_nested_attributes_for :examquestions,  reject_if: proc { |attributes| attributes['qnumber'].blank? || attributes['mark'].blank? }

	def full_title
		return self.title+" "+self.month+" "+self.year.to_s
	end
end
