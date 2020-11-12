module ApplicationHelper
  def get_sale_info
    active = Sale.active
    @sale_name = active[0].name
    @sale_discount = active[0].percent_off
  end
end
