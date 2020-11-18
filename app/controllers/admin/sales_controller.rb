class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
   @sales = Sale.all
  end

  def new 
  end

  def create
    sale = Sale.new(sale_params)
    if sale.save
      redirect_to '/admin/sales', notice: 'Sale created!'
    else
      render :new
    end
  end

  def sale_params
    params.require(:sale).permit(:name, :percent_off, :starts_on, :ends_on)
  end
end
