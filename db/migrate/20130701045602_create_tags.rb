class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.integer :photo_id, :null => false
      t.integer :author_id, :null => false

      t.timestamps
    end
    
    add_index :tags, :title
    add_index :tags, :photo_id
    add_index :tags, :author_id
  end
end
