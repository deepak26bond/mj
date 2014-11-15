module ApplicationHelper
def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, '/mjweller/collection_new?sort='+column+"&direction="+direction
end
def submenu(sort,sortby)
 new_item=ItemDetail.where(sort+" == ?" ,sortby).limit(3).joins(:price_detail)
 return new_item
end

end
