class User < ApplicationRecord

  ROLE_USER = 0
  ROLE_ADMIN = 1
  ROLE_SUPERADMIN = 2

  has_many :playlists, dependent: :destroy
  has_many :favorite_tracks, through: :favorites, source: :track

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    role == ROLE_ADMIN
  end

  def superadmin?
  	role == ROLE_SUPERADMIN
  end
end
