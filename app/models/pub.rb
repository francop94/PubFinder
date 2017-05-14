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

  has_one :menu, dependent: :destroy

  def avg_votes

    sum = 0
    self.reviews.each do |review|
      sum = sum + review.vote
    end
    sum = sum.to_f
    if self.reviews.count > 0
      return (sum/self.reviews.count).round(2)
    else return 0
    end
  end


    def validatee
    	self.validated = true
    	self.save
    # redirect_to root_path
  end


end

