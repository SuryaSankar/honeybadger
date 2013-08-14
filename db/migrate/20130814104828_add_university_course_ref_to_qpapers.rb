class AddUniversityCourseRefToQpapers < ActiveRecord::Migration
  def change
    add_reference :qpapers, :university_course, index: true
  end
end
