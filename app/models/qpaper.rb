class Qpaper < ActiveRecord::Base
        has_many :examquestions
	has_many :questions, through: :examquestions
	belongs_to :course
	belongs_to :user
	accepts_nested_attributes_for :examquestions
end
