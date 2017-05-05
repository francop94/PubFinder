class Pub < ApplicationRecord
  belongs_to :user
  has_many :microposts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :user_id, presence: true
  validates :address, presence: true, length: {maximum: 140}
  validates :name, presence: true, length: {maximum: 30, minimum: 5}

  has_many :favorite_pubs
  has_many :favorited_by, through: :favorite_pubs, source: :user
end
