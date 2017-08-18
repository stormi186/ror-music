class Track < ApplicationRecord
	belongs_to :genre
	belongs_to :album
	belongs_to :artist
	belongs_to :user

	has_many :artists, through: :artist_track
	has_many :favorites, dependent: :destroy
	has_many :favorited_by, through: :favorites, source: :user, dependent: :delete_all

	validates :name, presence: true, length: { maximum: 20 }
	validates :duration, presence: true, numericality: true

	def self.search(term)
  	if term
    	where('name LIKE ?', "%#{term}%")
  	else
    	all
  	end
	end
end
