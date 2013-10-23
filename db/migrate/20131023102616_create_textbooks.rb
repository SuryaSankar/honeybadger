class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :name
      t.string :flipkart_banner
      t.references :university_course, index: true
      t.timestamps
    end
  end
end
