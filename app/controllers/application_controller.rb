class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 
self.allow_forgery_protection = false
helper_method :item_data,:cat_data,:sub_data,:setter,:getter
 add_flash_types :error, :sussces
  protect_from_forgery with: :exception
def item_data
  @item_data=ItemDetail.order('id DESC').limit(4).joins(:price_detail)
 
 
  
end
def cat_data
  @cat_data=PriceDetail.all
end
def sub_data
  @sub_data=CategoryDetail.all
end
 
def getter
  @id
end

def setter(val)
  @id = val 
end
  
end
