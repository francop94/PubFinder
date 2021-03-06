class ReviewsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy, :edit, :update, :show]

  def create
  	@pub = Pub.find(params[:pub_id])
  	input = review_params.merge(pub: @pub)
    @review = current_user.reviews.build(input)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to(:back)
    else
      flash[:danger] = "Error in creating the review!"
      render 'static_pages/home'
    end
  end

    def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted"
    redirect_to(:back)
  end


  def show
  	@review = Review.find(params[:id])
  	@answer = Answer.new
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
      flash[:danger] = "Review was not modified"
      redirect_to(:back)
    end
  end


  private

    def review_params
      params.require(:review).permit(:content, :vote)
    end
end
