class AddContactDetailToTextBookSaleOffers < ActiveRecord::Migration
  def change
    add_column :text_book_sale_offers, :contact_detail, :text
  end
end
