class AddQTitleToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :qtitle, :string
  end
end
