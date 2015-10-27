class Review < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :movie
  belongs_to :user

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user

  validates :content, presence: true

end
