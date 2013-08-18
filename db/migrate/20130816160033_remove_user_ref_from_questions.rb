class RemoveUserRefFromQuestions < ActiveRecord::Migration
  def change
    remove_reference :questions, :user, index: true
  end
end
