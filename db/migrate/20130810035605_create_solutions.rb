class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :answer
      t.integer :votes
      t.boolean :correct

      t.timestamps
    end
  end
end
