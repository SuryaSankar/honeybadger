class AddUnitRefToCheatsheets < ActiveRecord::Migration
  def change
    add_reference :cheatsheets, :unit, index: true
  end
end
