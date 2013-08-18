class RemoveUserRefFromExamquestions < ActiveRecord::Migration
  def change
    remove_reference :examquestions, :user, index: true
  end
end
