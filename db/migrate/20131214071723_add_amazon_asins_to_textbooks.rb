class AddAmazonAsinsToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :amzasin, :string
  end
end
