class CreateGalleryPhotos < ActiveRecord::Migration
  def change
    create_table :gallery_photos do |t|
      t.integer :photo_id, :null => false
      t.integer :gallery_id, :null => false

      t.timestamps
    end
  end
end
