class Pub < ApplicationRecord
  belongs_to :user
  has_many :microposts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :user_id, presence: true
  validates :address, presence: true
  validates :name, presence: true

  has_many :favorite_pubs
  has_many :favorited_by, through: :favorite_pubs, source: :user

  has_many :visited_pubs 
  has_many :visiteds_by, through: :visited_pubs, source: :pub
end
