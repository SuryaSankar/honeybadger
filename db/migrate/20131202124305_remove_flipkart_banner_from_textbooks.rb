class RemoveFlipkartBannerFromTextbooks < ActiveRecord::Migration
  def change
    remove_column :textbooks, :flipkart_banner, :string
  end
end
