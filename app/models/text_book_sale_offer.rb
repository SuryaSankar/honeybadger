class TextBookSaleOffer < ActiveRecord::Base
  belongs_to :textbook, touch: true
  belongs_to :user
end
