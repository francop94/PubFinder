class AnswersController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    input = answer_params.merge(review: @review)
    @answer = current_user.answers.build(input)
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to(:back)
    else
      flash[:warning] = "Cannot post your answer"
      render 'static_pages/home'
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def answer_params
      params.require(:answer).permit(:content, :user_id, :review_id)
    end
end
