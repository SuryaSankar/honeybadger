class AddMonthToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :month, :string
  end
end
