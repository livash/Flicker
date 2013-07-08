class Tag < ActiveRecord::Base
  attr_accessible :title, :author_id
  
  validates :title, :presence => true
  validates_with TagValidator
  #write custom validation for tag being unique among tags for current user
  
  belongs_to :author,
  :class_name => "User"
  
  has_many :taggings, :dependent => :destroy
  has_many :photos, :through => :taggings, :source => :photo
  
  def unique_for_user?
    current_user.tags.include()
  end
  
end
