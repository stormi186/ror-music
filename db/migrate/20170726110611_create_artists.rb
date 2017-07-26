class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
    	t.string :name, null: false
    	t.string :picture
    	
    	t.timestamps
    end
  end
end
