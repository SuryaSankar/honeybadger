class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :qtext
      t.text :qdesc

      t.timestamps
    end
  end
end
