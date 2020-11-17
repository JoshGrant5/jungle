class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    info = Review.where(product_id: params[:id])
    @reviews = info.map { |item| { description: item.description, rating: item.rating, user: User.select('first_name', 'last_name').where(id: item.user_id) } }
  end

end
