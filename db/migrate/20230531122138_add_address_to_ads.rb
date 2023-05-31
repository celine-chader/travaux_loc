class AddAddressToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :address, :string
  end
end
