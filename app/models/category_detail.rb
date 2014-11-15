class CategoryDetail < ActiveRecord::Base
has_many :item_detail
validates :category, :description, presence: true
validates :category, uniqueness: true
 
end
