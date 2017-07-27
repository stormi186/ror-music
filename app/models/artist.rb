class Artist < ApplicationRecord
	has_many :tracks, dependent: :destroy
	#mount_uploader :picture, ArtistPictureUploader

	validates :name, presence: true, length: { maximum: 20 }
end
