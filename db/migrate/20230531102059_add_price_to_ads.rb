class AddPriceToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :price, :integer
  end
end
