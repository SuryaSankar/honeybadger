class AddQpaperRefToExamquestion < ActiveRecord::Migration
  def change
    add_index :examquestions, :qpaper_id
  end
end
