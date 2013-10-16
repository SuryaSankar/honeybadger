class RemoveQDescFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :qdesc, :text
  end
end
