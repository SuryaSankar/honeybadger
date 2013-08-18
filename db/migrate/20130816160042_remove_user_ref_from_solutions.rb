class RemoveUserRefFromSolutions < ActiveRecord::Migration
  def change
    remove_reference :solutions, :user, index: true
  end
end
