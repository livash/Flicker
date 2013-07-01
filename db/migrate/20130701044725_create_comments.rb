class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :author_id, :null => false
      t.integer :photo_id, :null => false

      t.timestamps
    end
    
    add_index :comments, :author_id
    add_index :comments, :photo_id
  end
end
