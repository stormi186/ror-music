class Playlist < ApplicationRecord
	has_one :user

	has_many :playlist_tracks
	has_many :track_playlists, through: :playlist_tracks, source: :track, dependent: :destroy

	validates :name, presence: true, length: { maximum: 20 }
end
