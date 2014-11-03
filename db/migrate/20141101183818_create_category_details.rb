class CreateCategoryDetails < ActiveRecord::Migration
  def change
    create_table :category_details do |t|
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
