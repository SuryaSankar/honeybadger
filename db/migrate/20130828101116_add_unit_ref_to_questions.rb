class AddUnitRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :unit, index: true
  end
end
