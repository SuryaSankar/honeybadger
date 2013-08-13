class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :degree_name

      t.timestamps
    end
  end
end
