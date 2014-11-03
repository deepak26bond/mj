class ItemDetail < ActiveRecord::Base
#belongs_to :category_detail
#belongs_to :price_detail
mount_uploader :image,ImageUploader
end
