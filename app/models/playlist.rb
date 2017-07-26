class Playlist < ApplicationRecord
	belongs_to :user

	has_many :tracks, through: :playlist_track

	validates :name, presence: true, length: { maximum: 20 }
end
