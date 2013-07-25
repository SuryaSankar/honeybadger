class CreateJoinTableQuestionQpaper < ActiveRecord::Migration
  def change
	create_join_table :qpapers, :questions
  end
end
