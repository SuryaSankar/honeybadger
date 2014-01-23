class AddUserReferencesToTextBookSaleOffers < ActiveRecord::Migration
  def change
    add_reference :text_book_sale_offers, :user, index: true
  end
end
