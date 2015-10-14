class Review < ActiveRecord::Base
  belongs_to :movie

  validates :content, presence: true
end
