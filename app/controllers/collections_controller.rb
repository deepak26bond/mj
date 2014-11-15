class CollectionsController < ApplicationController
  def collection
 @q = ItemDetail.search(params[:q])
  @item = @q.result
 
  end
end
