class AddUniversityCourseRefToQpaperFile < ActiveRecord::Migration
  def change
    add_reference :qpaper_files, :university_course, index: true
  end
end
