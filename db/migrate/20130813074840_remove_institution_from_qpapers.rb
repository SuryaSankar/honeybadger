class RemoveInstitutionFromQpapers < ActiveRecord::Migration
  def change
    remove_column :qpapers, :institution, :string
  end
end
