class QpapersProgramsJoin < ActiveRecord::Migration
  def change
	create_join_table :qpapers, :programs
  end
end
