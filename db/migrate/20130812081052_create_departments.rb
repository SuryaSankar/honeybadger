class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
	t.belongs_to :institution
	t.belongs_to :branch
    end
  end
end
