class AddFlipkartAffridToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :flipkart_affrid, :string
  end
end
