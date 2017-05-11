class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pub
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :pub_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :answers, dependent: :destroy

end
