class Chanecolmnname < ActiveRecord::Migration
  def change
rename_column :item_details, :pricedetail_id, :price_detail_id
rename_column :item_details, :categorydetail_id, :category_detail_id
  end
end
