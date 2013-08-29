class AddSuperTopicToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :super_topic_id, :integer
  end
end
