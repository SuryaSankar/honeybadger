class AddSubquestionNoToExamquestions < ActiveRecord::Migration
  def change
    add_column :examquestions, :subquestion_no, :integer
  end
end
