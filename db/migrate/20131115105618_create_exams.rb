class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :date
      t.string :session

      t.timestamps
    end
  end
end
