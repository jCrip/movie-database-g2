class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :realease_date, presence: true
  validates :studio, presence: true
end
