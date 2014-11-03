class AddCategoryToItemDetail < ActiveRecord::Migration
  def change
  add_column :item_details, :category, :string
   add_column :item_details, :subcategory, :string
  end
end
