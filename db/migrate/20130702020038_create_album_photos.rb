class CreateAlbumPhotos < ActiveRecord::Migration
  def change
    create_table :album_photos do |t|
      t.integer :album_id, :null => false
      t.integer :photo_id, :null => false

      t.timestamps
    end
    
    add_index :album_photos, :album_id
    add_index :album_photos, :photo_id
  end
end
