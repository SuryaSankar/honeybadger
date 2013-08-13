class AddOfficialToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :official, :boolean
  end
end
