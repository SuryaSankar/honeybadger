class Solution < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	has_many :accepted_solutions
end
