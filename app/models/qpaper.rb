class Qpaper < ActiveRecord::Base
	has_many :questions, through: :examquestions
	belongs_to :course
end
