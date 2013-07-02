class CreateCollectionAlbums < ActiveRecord::Migration
  def change
    create_table :collection_albums do |t|
      t.integer :collection_id, :null => false
      t.integer :album_id, :null => false

      t.timestamps
    end
    
    add_index :collection_albums, :collection_id
    add_index :collection_albums, :album_id
  end
end
