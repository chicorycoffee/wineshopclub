class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.string :name, null: false
      t.string :importer
      t.integer :genre_id, null: false
      t.integer :country_id, null: false
      t.integer :type_id, null: false
      t.integer :taste_id
      t.integer :grape_id
      t.integer :price_id
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
