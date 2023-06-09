class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :category
      t.text :description
      t.date :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
