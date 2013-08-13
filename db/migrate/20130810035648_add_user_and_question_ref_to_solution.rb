class AddUserAndQuestionRefToSolution < ActiveRecord::Migration
  def change
	add_reference :solutions, :user, index: true
	add_reference :solutions, :question, index: true
  end
end
