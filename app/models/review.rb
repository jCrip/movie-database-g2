class Review < ActiveRecord::Base
  include Likes
  belongs_to :movie
  belongs_to :user

  has_many :likes, as: :likable
  has_many :user_likes, through: :likes, source: :user

  validates :content, presence: true

end
