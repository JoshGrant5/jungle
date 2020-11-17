class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    review = Review.new(
      product_id: params[:product_id].to_i, 
      description: review_params[:description], 
      rating: review_params[:rating].to_i,
      user_id: current_user.id
    )
    if review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Review created!'
    else
      redirect_to "/products/#{params[:product_id]}", notice: 'Could not add review'
    end
  end

  def destroy
    @review = Review.find params[:id]

    if @review.destroy
      redirect_to "/products/#{params[:product_id]}", notice: 'Review has been destroyed!'
    end
  end

  def review_params 
    params.require(:products).permit(:description, :rating)
  end

end
