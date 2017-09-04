class Track < ApplicationRecord
	belongs_to :genre
	belongs_to :album
	belongs_to :artist
	belongs_to :user

	has_many :favorites
	has_many :favorited_by, through: :favorites, source: :user, dependent: :destroy
	has_many :playlist_tracks
	has_many :playlist_added, through: :playlist_tracks, source: :playlist, dependent: :destroy

	validates :name, presence: true, length: { maximum: 20 }
	validates :duration, presence: true

	def self.search(term)
  	if term
    	where('name LIKE ?', "%#{term}%")
  	else
    	all
  	end
	end
end
