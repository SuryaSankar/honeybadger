class CreateQpaperFiles < ActiveRecord::Migration
  def change
    create_table :qpaper_files do |t|

      t.timestamps
    end
  end
end
