class CreateItemDetails < ActiveRecord::Migration
  def change
    create_table :item_details do |t|
      t.string :name
      t.text :description
      t.float :weight
      t.integer :price_detail_id
      t.integer :category_detail_id
      t.integer :quantity
      t.string :image 
      t.timestamps
    end
  end
end
