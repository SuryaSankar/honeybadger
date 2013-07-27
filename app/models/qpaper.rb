class Qpaper < ActiveRecord::Base
        has_many :examquestions
	has_many :questions, through: :examquestions
	belongs_to :course
	accepts_nested_attributes_for :examquestions
end
