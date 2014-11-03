class CreatePriceDetails < ActiveRecord::Migration
  def change
    create_table :price_details do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
