class CollectionAlbum < ActiveRecord::Base
  attr_accessible :album_id, :collection_id
  
  belongs_to :album
  belongs_to :collection
end
