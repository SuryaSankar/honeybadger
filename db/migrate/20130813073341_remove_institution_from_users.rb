class RemoveInstitutionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :institution, :string
  end
end
