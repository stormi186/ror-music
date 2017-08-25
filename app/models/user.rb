class User < ApplicationRecord
	attr_accessor :remember_token

  ROLE_USER = 0
  ROLE_ADMIN = 1
  ROLE_SUPERADMIN = 2

  has_many :tracks
  has_many :albums
  has_many :genres
  has_many :artists
  has_many :playlists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tracks, through: :favorites, source: :track, dependent: :delete_all

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }, 
  									uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
  	update_attribute(:remember_digest, nil)
  end

  def admin?
    role == ROLE_ADMIN
  end

  def superadmin?
  	role == ROLE_SUPERADMIN
  end
end
