class Track < ApplicationRecord
	belongs_to :genre
	belongs_to :album

	has_many :artists, through: :artist_track

	validates :name, presence: true, length: { maximum: 20 }
end
