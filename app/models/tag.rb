class Tag < ActiveRecord::Base
  attr_accessible :title, :author_id
  
  #validates :title, :uniqueness => true
  #write custom validation for tag being unique among tags for current user
  
  belongs_to :author,
  :class_name => "User"
  
  has_many :taggings
  has_many :photos, :through => :taggings, :source => :photo
  
end
