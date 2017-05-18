require 'rails_helper'




RSpec.describe Review, :type => :model do
	it "orders by created_at" do
		rev1 = Review.create!(content: "ciaone", user_id: 1, pub_id: 2, vote: 3)
		rev2 = Review.create!(content: "ciaone", user_id: 2, pub_id: 3, vote: 2)
		expect(Review.ordered_by_created_at).to eq([rev1, rev2])
	end

end
