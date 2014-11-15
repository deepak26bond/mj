class PriceDetail < ActiveRecord::Base
has_many :item_detail 
validates :name, :price, presence: true
validates :name, uniqueness: true
 validates :price, numericality: true
end
