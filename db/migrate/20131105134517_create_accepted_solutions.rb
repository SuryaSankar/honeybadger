class CreateAcceptedSolutions < ActiveRecord::Migration
  def change
    create_table :accepted_solutions do |t|
      t.boolean :accept

      t.timestamps
    end
  end
end
