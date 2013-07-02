class Album < ActiveRecord::Base
  attr_accessible :description, :title
  
  validates :title, :presence => true
  
  has_many :album_photos
  
  has_many :photos, :through => :album_photos, :source => :photo
end
