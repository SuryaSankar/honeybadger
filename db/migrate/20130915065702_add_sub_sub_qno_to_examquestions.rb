class AddSubSubQnoToExamquestions < ActiveRecord::Migration
  def change
    add_column :examquestions, :subsubqno, :integer
  end
end
