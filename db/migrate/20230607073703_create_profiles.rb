class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :shop
      t.integer :prefecture_id
      t.integer :customer_id
      t.integer :price_id
      t.integer :country_id
      t.text :introduction
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
