class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id, :null => false
      t.integer :photo_id, :null => false

      t.timestamps
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, :photo_id
    
    remove_column :tags, :photo_id
  end
end
