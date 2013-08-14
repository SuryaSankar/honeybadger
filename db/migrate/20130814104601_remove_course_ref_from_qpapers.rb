class RemoveCourseRefFromQpapers < ActiveRecord::Migration
  def change
    remove_reference :qpapers, :course, index: true
  end
end
