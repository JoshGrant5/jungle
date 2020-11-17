class ReviewsController < ApplicationController

  def create
    review = Review.new(
      product_id: params[:product_id].to_i, 
      description: review_params[:description], 
      rating: review_params[:rating].to_i,
      user_id: current_user.id
    )
    if review.save!
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{@product.id}"
    end
  end

  def review_params 
    params.require(:products).permit(:description, :rating)
  end

end
