class AddUserRefToExamQuestions < ActiveRecord::Migration
  def change
	add_reference :examquestions, :user, index: true
  end
end
