class AddImageToItemDetail < ActiveRecord::Migration
  def change
    add_column :item_details, :image, :string
  end
end
