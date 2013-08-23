class AddIndicesToProgramQpapersJoinTable < ActiveRecord::Migration
  def change
	add_index :programs_qpapers, :qpaper_id
	add_index :programs_qpapers, :program_id
  end
end
