class RemoveUnameFromAuthentications < ActiveRecord::Migration
  def change
    remove_column :authentications, :uname, :string
    remove_column :authentications, :string, :string
  end
end
