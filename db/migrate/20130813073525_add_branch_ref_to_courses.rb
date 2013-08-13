class AddBranchRefToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :branch, index: true
  end
end
