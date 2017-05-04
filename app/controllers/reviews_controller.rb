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
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end
end
