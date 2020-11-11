class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
    names = Category.select('id', 'name')
    @categories = names.map { |name| { name: name[:name], quantity: Product.where(category_id: name[:id]).count } }
  end

  def new

  end

  def create

  end
end
