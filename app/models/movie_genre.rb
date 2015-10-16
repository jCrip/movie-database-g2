class MovieGenre < ActiveRecord::Base
  belongs_to :movie
  belongs_to :genre

  validates :movie_id, uniqueness: { scope: :genre_id }
end
