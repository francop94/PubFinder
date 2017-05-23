class AnswersController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    input = answer_params.merge(review: @review)
    @answer = current_user.answers.build(input)
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to(:back)
    else
      flash[:danger] = "Answer not posted, the content should have at least 10 characters."
      redirect_to(:back)
    end
  end

  def show
  end

  def index
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    
    if @answer.update_attributes(answer_params)
      flash[:success] = "Answer updated"
      redirect_to review_path(@answer.review)
    else
      flash[:danger] = "Answer was not modified"
      redirect_to(:back)
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    flash[:success] = "Answer deleted"
    redirect_to(:back)
  end


  private

    def answer_params
      params.require(:answer).permit(:content, :user_id, :review_id)
    end
end
