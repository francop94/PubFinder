require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

def setup
    @answer = answers(:some_answer)
    @review = reviews(:some_review)
    @answer_owner = users(:archer)
    @pub = pubs(:irish)
end


  test "should get show" do
    get review_answer_path(reviews(:some_review), answers(:some_answer))
    assert_response :success
  end

  test "should get index" do
    get answers_path
    assert_response :success
  end

  test "should get edit" do
    get edit_review_answer_path(reviews(:some_review), answers(:some_answer))
    assert_response :success
  end


end
