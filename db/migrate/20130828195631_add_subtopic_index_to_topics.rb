class AddSubtopicIndexToTopics < ActiveRecord::Migration
  def change
	add_index "topics", ["super_topic_id"], name: "index_subtopics_on_super_topic_id"
  end
end
