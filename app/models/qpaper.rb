class Qpaper < ActiveRecord::Base
        has_many :examquestions
	has_many :questions, through: :examquestions
	belongs_to :university_course
	belongs_to :user
	accepts_nested_attributes_for :examquestions,  reject_if: proc { |attributes| attributes['qnumber'].blank? || attributes['mark'].blank? }, update_only: true
end
