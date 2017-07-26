class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
    	t.string :name, null: false
    	t.string :cover

    	t.timestamps
    end
  end
end
