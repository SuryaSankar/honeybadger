class CreateSelfjoinTableOutdatedCourseUpdatedCourse < ActiveRecord::Migration
  def change
    create_table 'outdated_courses_updated_courses', :id => false do |t|
        t.column :outdated_course_id, :integer
        t.column :updated_course_id, :integer
    end	
    add_index(:outdated_courses_updated_courses, [:outdated_course_id, :updated_course_id], :unique => true, name: "ocs_ucs_on_outdated_course_id_and_updated_course_id")
  end
end
