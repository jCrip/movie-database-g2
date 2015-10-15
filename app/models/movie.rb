class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  # has_and_belongs_to_many :genres
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :title, presence: true
  validates :realease_date, presence: true
  validates :studio, presence: true
end
