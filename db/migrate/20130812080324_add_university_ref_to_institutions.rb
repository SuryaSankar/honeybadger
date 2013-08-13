class AddUniversityRefToInstitutions < ActiveRecord::Migration
  def change
    add_reference :institutions, :university, index: true
  end
end
