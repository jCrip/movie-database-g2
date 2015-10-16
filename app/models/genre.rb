class Genre < ActiveRecord::Base
  # has_and_belongs_to_many :movies

  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def to_s
    self.name
  end
end
