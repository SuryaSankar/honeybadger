class AddTextBookReferenceToTextBookSaleOffers < ActiveRecord::Migration
  def change
    add_reference :text_book_sale_offers, :textbook, index: true
  end
end
