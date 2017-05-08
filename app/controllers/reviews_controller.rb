class ReviewsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

  def create
  	@pub = Pub.find(params[:pub_id])
  	input = review_params.merge(pub: @pub)
    @review = current_user.reviews.build(input)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to(:back)
    else
      render 'static_pages/home'
    end
  end

    def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted"
    redirect_to(:back)
  end

  def edit 
    @review = Review.find(params[:id])

  end

  def update
    @review = Review.find(params[:id])
    
    if @review.update_attributes(review_params)
      flash[:success] = "Review updated"
      redirect_to pub_path(@review.pub)
    else
      flash[:warning] = "Review was not modified"
      redirect_to(:back)
    end
  end


  private

    def review_params
      params.require(:review).permit(:content)
    end
end
