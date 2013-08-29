class AddCourseRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :course, index: true
  end
end
