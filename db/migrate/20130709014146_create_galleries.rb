class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
