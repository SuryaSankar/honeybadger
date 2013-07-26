require_relative '20130725113930_create_join_table_question_qpaper'
class ReplaceQpaperQuestionHbtmWithThroughMigration < ActiveRecord::Migration
  def change
    revert CreateJoinTableQuestionQpaper

    create_table :examquestions do |t|
        t.belongs_to :question
	t.belongs_to :qpaper
	t.integer :mark
	t.integer :qnumber
        t.timestamps
    end
  end
end
