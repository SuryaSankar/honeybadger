class ChangeTableQpaperBelongsToCourse < ActiveRecord::Migration
  def change
	change_table :qpapers do |t|
		t.belongs_to :course
	end
  end
end
