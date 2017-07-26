class Genre < ApplicationRecord
	has_many :tracks, dependent: :destroy

	validates :name, presence: true, length: { maximum: 20 }
end
