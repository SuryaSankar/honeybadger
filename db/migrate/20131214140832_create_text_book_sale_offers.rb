class CreateTextBookSaleOffers < ActiveRecord::Migration
  def change
    create_table :text_book_sale_offers do |t|
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
