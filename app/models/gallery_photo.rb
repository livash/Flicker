class GalleryPhoto < ActiveRecord::Base
  attr_accessible :gallery_id, :photo_id
  
  belongs_to :gallery
  belongs_to :photo
end
