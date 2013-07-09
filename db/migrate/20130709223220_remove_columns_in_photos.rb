class RemoveColumnsInPhotos < ActiveRecord::Migration
  def up
    remove_column :photos, :content_type
    remove_column :photos, :filename
    remove_column :photos, :data
  end

  def down
    add_column :photos, :content_type, :string
    add_column :photos, :filename, :string
    add_column :photos, :data, :binary
  end
end
