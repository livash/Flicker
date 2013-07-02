class AlbumPhoto < ActiveRecord::Base
  attr_accessible :album_id, :photo_id
  
  belongs_to :album
  belongs_to :photo
  
end
