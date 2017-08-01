class ChangeArtistDefaultPicture < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :artists, :picture, 'https://dictionary.onmusic.org/assets/images/no_image.jpg'
  end
end
