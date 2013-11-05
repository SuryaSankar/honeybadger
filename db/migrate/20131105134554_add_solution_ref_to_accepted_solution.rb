class AddSolutionRefToAcceptedSolution < ActiveRecord::Migration
  def change
    add_reference :accepted_solutions, :solution, index: true
  end
end
