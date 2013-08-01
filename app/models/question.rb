class Question < ActiveRecord::Base
	has_many :qpapers, through: :examquestions
	belongs_to :user
end
