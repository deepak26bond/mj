class AddProctDetailAndStyleNoteToItemDetail < ActiveRecord::Migration
  def change
  add_column :item_details, :product_deatil, :text
  add_column :item_details, :style_note, :text
  
  end
end
