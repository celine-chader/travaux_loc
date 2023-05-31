class AddCoordinatesToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :latitude, :float
    add_column :ads, :longitude, :float
  end
end
