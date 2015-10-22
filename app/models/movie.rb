class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # has_and_belongs_to_many :genres
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user

  validates :title, presence: true
  validates :realease_date, presence: true
  validates :studio, presence: true

  default_scope { order(realease_date: :desc) }
end
