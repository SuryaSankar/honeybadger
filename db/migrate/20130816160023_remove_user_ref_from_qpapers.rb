class RemoveUserRefFromQpapers < ActiveRecord::Migration
  def change
    remove_reference :qpapers, :user, index: true
  end
end
