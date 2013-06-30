class AddDataColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :data, :binary
    remove_column :photos, :binary_data
  end
end
