class AcceptedSolution < ActiveRecord::Base
	validates_uniqueness_of :user_id, scope: [:solution_id]
	belongs_to :solution
	belongs_to :user
end
