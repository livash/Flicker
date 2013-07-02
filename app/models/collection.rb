class Collection < ActiveRecord::Base
  attr_accessible :description, :title
  
  validates :title, :presence => true
  
  has_many :collection_albums
  has_many :albums, :through => :collection_albums, :source => :album
end
