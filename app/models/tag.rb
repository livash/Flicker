class Tag < ActiveRecord::Base
  attr_accessible :title, :author_id
  
  validates :title, :presence => true
  validate :tag_is_unique_for_user
  #write custom validation for tag being unique among tags for current user
  
  belongs_to :author,
  :class_name => "User"
  
  has_many :taggings, :dependent => :destroy
  has_many :photos, :through => :taggings, :source => :photo
  
  def tag_is_unique_for_user
    all_titles = Tag.where(:author_id => author_id, :title => title).map(&:title)
    
    if all_titles.include?(title)
      errors.add(:title, "tag with such title already exists")
    end
  end
  
end
