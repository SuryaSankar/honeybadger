class Question < ActiveRecord::Base
	has_many :examquestions
	has_many :qpapers, through: :examquestions
	has_many :solutions
	belongs_to :user
end
