class AddUserRefToQpaperFile < ActiveRecord::Migration
  def change
    add_reference :qpaper_files, :user, index: true
  end
end
