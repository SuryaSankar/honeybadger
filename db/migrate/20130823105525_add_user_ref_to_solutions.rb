class AddUserRefToSolutions < ActiveRecord::Migration
  def change
    add_reference :solutions, :user, index: true
  end
end
