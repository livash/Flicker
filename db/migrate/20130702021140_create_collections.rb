class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title, :null => false
      t.text :description

      t.timestamps
    end
  end
end
