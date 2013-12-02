class AddFlipkartBannerToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :flipkart_banner, :text
  end
end
