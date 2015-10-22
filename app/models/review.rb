class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user

  validates :content, presence: true
end
