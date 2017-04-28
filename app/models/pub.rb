class Pub < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :address, presence: true, length: {maximum: 140, minimum: 20}
  validates :name, presence: true, length: {maximum: 30, minimum: 5}
end
