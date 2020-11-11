class Admin::DashboardController < ApplicationController
  # Display a count of how many products are in the database
  # Display a count of how many categories are in the database
  def show
    @product_count = Product.select('id', 'name', 'quantity')
    @total_inventory = Product.sum(:quantity)
    @category_count = Category.select('id', 'name')
  end
end
