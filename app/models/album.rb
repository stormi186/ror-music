class Album < ApplicationRecord
	has_many :tracks, dependent: :destroy
	mount_uploader :cover, AlbumCoverUploader

	validates :name, presence: true, length: { maximum: 20 }
end
