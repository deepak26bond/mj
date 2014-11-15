class ItemDetail < ActiveRecord::Base
belongs_to :category_detail
belongs_to :price_detail
 validates :weight,:quantity, numericality: true
validates :name,:description,:weight,:quantity,:price_detail_id,:category_detail_id,:image, presence: true
mount_uploader :image,ImageUploader
end
