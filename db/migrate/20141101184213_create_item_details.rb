class CreateItemDetails < ActiveRecord::Migration
  def change
    create_table :item_details do |t|
      t.string :name
      t.text :description
      t.string :weight
      t.integer :pricedetail_id
      t.integer :categorydetail_id
      t.integer :quantity

      t.timestamps
    end
  end
end
