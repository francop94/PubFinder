class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :pub 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 240 }
  validates :pub_id, presence: true 


end
