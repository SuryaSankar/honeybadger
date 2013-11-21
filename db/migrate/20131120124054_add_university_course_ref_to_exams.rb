class AddUniversityCourseRefToExams < ActiveRecord::Migration
  def change
    add_reference :exams, :university_course, index: true
  end
end
