class Question < ActiveRecord::Base
	has_many :qpapers, through: :examquestions
end
