class CreateSouvenirs < ActiveRecord::Migration[6.1]
  def change
    create_table :souvenirs do |t|

      t.integer:customer_id, null: false
      t.string :item_name, null: false
      t.text :store_name,  null: false
      t.integer :price, null: false
      t.integer :prefectural_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end

   