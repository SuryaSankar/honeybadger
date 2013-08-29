class AddTopicRefToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :topic, index: true
  end
end
