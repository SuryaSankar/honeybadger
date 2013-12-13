class RemoveFlipkartBannerFromTextbooks < ActiveRecord::Migration
  def change
    remove_column :textbooks, :flipkart_banner, :text
  end
end
