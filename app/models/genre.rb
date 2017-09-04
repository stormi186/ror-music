class Genre < ApplicationRecord
	belongs_to :user
	
	has_many :albums, dependent: :destroy
	has_many :tracks, dependent: :destroy

	validates :name, presence: true, length: { maximum: 20 }
end
