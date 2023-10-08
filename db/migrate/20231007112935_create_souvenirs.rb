class CreateSouvenirs < ActiveRecord::Migration[6.1]
  def change
    create_table :souvenirs do |t|

      t.integer:customer_id, null: false
      t.string :item_name, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.integer :prefecture_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end

