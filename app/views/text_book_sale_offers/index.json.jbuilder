json.array!(@text_book_sale_offers) do |text_book_sale_offer|
  json.extract! text_book_sale_offer, 
  json.url text_book_sale_offer_url(text_book_sale_offer, format: :json)
end
