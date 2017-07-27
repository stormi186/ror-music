class Album < ApplicationRecord
	belongs_to :genre
	belongs_to :artist
	
	has_many :tracks, dependent: :destroy
	#mount_uploader :cover, AlbumCoverUploader

	validates :name, presence: true, length: { maximum: 20 }
	validates :year, presence: true, numericality: true
end