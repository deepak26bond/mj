class Changetype < ActiveRecord::Migration
  def change
   change_column :item_details, :weight, :float
  change_column :price_details, :price, :integer
 
  end
end
