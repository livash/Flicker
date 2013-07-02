class Album < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :presence => true

  belongs_to :user

  has_many :album_photos
  has_many :photos, :through => :album_photos, :source => :photo

  has_many :collection_albums
  has_one :collection, :through => :collection_albums, :source => :collection

end