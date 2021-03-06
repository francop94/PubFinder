class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true, length: { maximum: 140, minimum: 10 }

end
