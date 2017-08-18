class Playlist < ApplicationRecord
	has_one :user, dependent: :destroy

	has_many :playlist_tracks, dependent: :destroy
	has_many :track_playlists, through: :playlist_track, source: :track, dependent: :delete_all

	validates :name, presence: true, length: { maximum: 20 }
end
