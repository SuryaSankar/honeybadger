class AddInstitutionAndBranchIndicesToDepartments < ActiveRecord::Migration
  def change
	add_index :departments, :institution_id
	add_index :departments, :branch_id
  end
end
