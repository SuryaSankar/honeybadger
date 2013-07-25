class CreateJoinTableQuestionQpaper < ActiveRecord::Migration
  def change
	create_join_table :qpapers, :questions do |t|
	  t.index :qpaper_id
	  t.index :question_id
	end
  end
end
