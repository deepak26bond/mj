class MjwellerController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

 def item_detail
   if session[:admin]
   @item=ItemDetail.new
 else 
   redirect_to "/users/admin_login"
 end

end
def add_detail
 if session[:admin]
  @item = ItemDetail.new(item_params)

if @item.save
 redirect_to "/mjweller/item_detail" ,sussces: "added susscesfully"
end
else
 redirect_to "/users/admin_login"
end
end
def collection
  @item=ItemDetail.all
end
def price 
if session[:admin]
@price=PriceDetail.new  
else 
   redirect_to "/users/admin_login"
end

end
def  add_price
  if session[:admin]
  name=params[:pricedata][:name]
  price=params[:pricedata][:price]
 
 @price =PriceDetail.find_by_name(name)
  if @price
  if @price.update(:name=>name,:price=>price)  
    redirect_to "/mjweller/price"
 
  end
else
@price=PriceDetail.new(:name=>name,:price=>price)
if @price.save
  redirect_to "/mjweller/price"
 
end
end
else 
   redirect_to "/users/admin_login"
end
end
def price_all
  @price=PriceDetail.all
  
end
def total_collection
if session[:admin]
  @total=ItemDetail.all
else 
   redirect_to "/users/admin_login"
end

end
def update
 if session[:admin]
  id=params["id"]
  @update=ItemDetail.find(id)
else 
   redirect_to "/users/admin_login"
end

end
def add_update
 if session[:admin]
  id=params[:itemdata][:id]
  @update=ItemDetail.find(id)
  if @update.update(item_params)
    redirect_to "/mjweller/total_collection"
  end
else 
   redirect_to "/users/admin_login"
end
end

def delete
if session[:admin]
  id=params["id"]
  @delete=ItemDetail.find(id).destroy
  redirect_to "/mjweller/total_collection"
end
end
def item_params
  params.require(:itemdata).permit(:name,:description,:weight,:quantity,:category,:subcategory,:image)
end
end
