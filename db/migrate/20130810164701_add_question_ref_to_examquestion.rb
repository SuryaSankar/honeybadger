class AddQuestionRefToExamquestion < ActiveRecord::Migration
  def change
    add_index :examquestions, :question_id
  end
end
