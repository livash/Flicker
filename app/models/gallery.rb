class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  
  belongs_to :user
  
  has_many :gallery_photos
  
  has_many :photos, :through => :gallery_photos, :source => :photo
end
