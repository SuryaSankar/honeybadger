class AddUserRefToCheatsheets < ActiveRecord::Migration
  def change
    add_reference :cheatsheets, :user, index: true
  end
end
