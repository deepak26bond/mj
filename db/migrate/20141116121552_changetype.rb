class Changetype < ActiveRecord::Migration
  def change
    change_column :item_details, :weight,'float USING CAST(weight AS float)'
    change_column :price_details, :price, 'integer USING CAST(price AS integer)'
 
  end
end
