class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    info = Review.where(product_id: params[:id]).order('created_at DESC')
    @reviews = info.map { |item| { description: item.description, rating: item.rating, created_at: item.created_at, 
      user: User.select('first_name', 'last_name').where(id: item.user_id) } }
    @user = session[:user_id]
  end

end
