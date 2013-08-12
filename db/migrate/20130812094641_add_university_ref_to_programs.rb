class AddUniversityRefToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :university, index: true
  end
end
