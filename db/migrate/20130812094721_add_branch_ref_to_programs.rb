class AddBranchRefToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :branch, index: true
  end
end
