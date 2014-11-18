class MjwellerController < ApplicationController
  helper_method :sort_column, :sort_direction
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
def item_detail
  @price=PriceDetail.all
@subcategory=CategoryDetail.all
end
def add_detail
 if session[:admin]
  @item = ItemDetail.new(item_params)

if @item.save
 redirect_to "/mjweller/item_detail" ,sussces: "added susscesfully"
else redirect_to "/mjweller/item_detail",error: @item.errors.to_a
end
else
 redirect_to "/users/admin_login"
end
end
def collection
  
  @item=ItemDetail.order(sort_column + " " + sort_direction).joins(:price_detail).paginate(:page => params[:page], :per_page =>12)
 @category=PriceDetail.all
 @subcategory=CategoryDetail.all
  respond_to do |format|
    format.html 
    format.json { render json: @item }
    format.js
  end
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
@price=PriceDetail.new(:name=>name,:price=>price)
if @price.save
  redirect_to "/mjweller/price" ,sussces:"new category add sussesfully"
else
redirect_to "/mjweller/price",error: @price.errors.to_a
end

else 
   redirect_to "/users/admin_login"
end
end
def price_update
  if session[:admin]
    @update=PriceDetail.all
    
  end
end
  
def price_update_db
  if session[:admin]
   id=params[:pricedata][:id]
  price=params[:pricedata][:price] 
 @update=PriceDetail.find(id)
 if @update.update_attribute('price',price)
   redirect_to "/mjweller/price_update" ,sussces:"price updated sussesfully"
 end
  end
end
def price_all
  @price=PriceDetail.all
  
end
def total_collection
if session[:admin]
  
  
  @q=ItemDetail.search(params[:q])
  @total = @q.result
   respond_to do |format|
    format.html 
    format.json { render json: @total }
    format.js
     end
else 
   redirect_to "/users/admin_login"
end

end
def update
 if session[:admin]
  id=params["id"]
  @update=ItemDetail.find(id)
  @category=PriceDetail.all
  @subcategory=CategoryDetail.all
else 
   redirect_to "/users/admin_login"
end

end
def add_update
 if session[:admin]
  id=params[:itemdata][:id]
  @update=ItemDetail.find(id)
  if @update.update(item_params)
    redirect_to "/mjweller/total_collection",sussces:"item updated sussesfully"
  end
else 
   redirect_to "/users/admin_login"
end
end

def delete
if session[:admin]
  id=params["id"]
  @delete=ItemDetail.find(id).destroy
  redirect_to "/mjweller/total_collection" ,sussces:"item deleted sussesfully"
end
end
def add_subcategory
  
end
def add_subcat_db
  name=params[:subdata][:category]
  des=params[:subdata][:description]
  @sub=CategoryDetail.new :category=>name ,:description=>des
  if @sub.save
    redirect_to "/mjweller/add_subcategory" ,sussces: "subcategory added susscesfully"
else
redirect_to "/mjweller/add_subcategory",error: @sub.errors.to_a
  end
end
  
def search_weight
  id=params[:weight].split(',')
  
  @item=ItemDetail.order("weight ASC").where("weight>= ? AND weight<= ? ",id.first,id.last).paginate(:page => params[:page], :per_page =>6)
respond_to do |format|
    format.html 
    format.json { render json: @item }
    format.js

end
end
def search_id
  
  id=params['id']
  
  @item=ItemDetail.where(params["type"]+" == ?" ,id).paginate(:page => params[:page], :per_page =>4)
respond_to do |format|
    format.html{render '/mjweller/collection_new'} 
    format.json { render json: @item }
    format.js

end
end

def collection_new

if params['type'].nil?
  session[:category_id]=nil
session[:cat_name]=nil
@item=ItemDetail.order(sort_column + " " + sort_direction).joins(:price_detail).paginate(:page => params[:page], :per_page =>6)
respond_to do |format|
     format.html{} 
    # format.json { render json: @item }
     format.js
  end
else
  if params['type']=='category_detail_id'
  session[:category_id]=params['id']
  session[:cat_name]=CategoryDetail.find(session[:category_id]).category
 @item=ItemDetail.where(params['type']=> [session[:category_id]]).joins(:price_detail).paginate(:page => params[:page], :per_page =>9)
respond_to do |format|
format.html{} 
   # format.json { render json: @item }
    format.js

end
elsif  params['type']=='price_detail_id' && session[:category_id]
  id=params['id'].split(',')
  @item=ItemDetail.where('category_detail_id == (?) AND price_detail_id IN (?) '  , session[:category_id],id).joins(:price_detail).paginate(:page => params[:page], :per_page =>9)
respond_to do |format|
format.html{} 
   # format.json { render json: @item }
    format.js
end

else
   id=params['id'].split(',')
  @item=ItemDetail.where(params['type']=> [id]).joins(:price_detail).paginate(:page => params[:page], :per_page =>9)
respond_to do |format|
format.html{} 
   # format.json { render json: @item }
    format.js
end
end
end
end

def detail
  id=params['id']
  @item=ItemDetail.find(id)

end
def mail_send
UserMailer.user_mailer(mail_params).deliver
  redirect_to "/mjweller/contact",sussces: 'your message are susscesfully send'
  end   
def item_params
  params.require(:itemdata).permit(:name,:description,:weight,:quantity,:price_detail_id,:category_detail_id,:image)
end
private
  
  def sort_column
    ItemDetail.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
def mail_params
     params.require(:mail).permit(:name,:subject,:email,:message,:mobile)

end
end
