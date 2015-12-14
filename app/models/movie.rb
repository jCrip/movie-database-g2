class Movie < ActiveRecord::Base
  include Likes
  before_save :save_movie_genres, if: -> { genres_ids.present? }

  belongs_to :user
  has_many :reviews, dependent: :destroy

  # has_and_belongs_to_many :genres
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  has_many :likes, as: :likable
  has_many :user_likes, through: :likes, source: :user

  validates :title, presence: true
  validates :realease_date, presence: true
  validates :studio, presence: true

  attr_accessor :genres_ids

  def save_movie_genres
    if genres_ids.present?
      genres = Genre.find(genres_ids)
      self.genres = genres
    end
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.country}"
  end

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # default_scope { order(realease_date: :desc) }
end
