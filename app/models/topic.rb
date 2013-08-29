class Topic < ActiveRecord::Base
  has_many :subtopics, class_name: "Topic",
                          foreign_key: "super_topic_id"
 
  belongs_to :super_topic, class_name: "Topic"
end
