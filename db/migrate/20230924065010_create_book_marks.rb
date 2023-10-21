class CreateBookMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.integer :customer_id, null: false
      t.integer :souvenir_id, null: false

      t.timestamps
    end
  end
end
