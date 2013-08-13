class AddTitleToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :title, :text
  end
end
