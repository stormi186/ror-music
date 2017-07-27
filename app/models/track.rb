class Track < ApplicationRecord
	belongs_to :genre
	belongs_to :album
	belongs_to :artist

	has_many :artists, through: :artist_track
	has_many :favorited_by, through: :favorites, source: :users

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
