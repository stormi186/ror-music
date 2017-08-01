class ChangeAlbumDefaultCover < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :albums, :cover, 'https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg' 
  end
end
