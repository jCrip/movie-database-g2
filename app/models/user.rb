class User < ActiveRecord::Base

  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :movie_likes, through: :likes, source: :movie
  has_many :review_likes, through: :likes, source: :review

  validates :username, uniqueness: { case_sensitive: false }
  validate :validate_username

  enum role: [:admin, :editor, :basic, :guest]

  def default_role
    self.role ||= 2
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def to_s
    "#{self.name} #{self.lastname}"
  end
end
