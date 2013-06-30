class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.integer :owner_id, :null => false
      t.binary :binary_data
      t.string :title
      t.string :content_type

      t.timestamps
    end
    
    add_index :photos, :owner_id 
  end
end
