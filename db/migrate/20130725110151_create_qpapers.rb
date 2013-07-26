class CreateQpapers < ActiveRecord::Migration
  def change
    create_table :qpapers do |t|
      t.integer :year
      t.string :institution

      t.timestamps
    end
  end
end
