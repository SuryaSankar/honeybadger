class AddUserRefToQpapers < ActiveRecord::Migration
  def change
    add_reference :qpapers, :user, index: true
  end
end
