class RenameCheatsheetsToNotes < ActiveRecord::Migration
  def change
	rename_table :cheatsheets, :notes
  end
end
