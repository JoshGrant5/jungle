class ReviewsController < ApplicationController

  def create
    Review.create(
      product_id: params[:product_id].to_i,
      user_id: session[:user_id].to_i,
      description: review_params[:description],
      rating: review_params[:rating].to_i
    )
  end

  def review_params 
    params.require(:products).permit(:description, :rating)
  end

end
