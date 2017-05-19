require "spec_helper"
require "review"



describe Review do
	before :each do
	@review = Review.new
end

	it "should be properly initialized" do
		expect(@review).to be_a(Review)
	end


	it "should have content" do
		review = Review.new
		expect(review.content).to eq("contenuto")
	end
end

