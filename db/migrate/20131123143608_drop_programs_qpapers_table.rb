class DropProgramsQpapersTable < ActiveRecord::Migration
  def change
    drop_table :programs_qpapers
  end
end
