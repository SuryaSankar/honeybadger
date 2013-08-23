class RemoveUemailFromAuthentications < ActiveRecord::Migration
  def change
    remove_column :authentications, :uemail, :string
    remove_column :authentications, :string, :string
  end
end
