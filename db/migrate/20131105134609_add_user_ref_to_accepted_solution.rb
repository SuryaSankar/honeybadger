class AddUserRefToAcceptedSolution < ActiveRecord::Migration
  def change
    add_reference :accepted_solutions, :user, index: true
  end
end
