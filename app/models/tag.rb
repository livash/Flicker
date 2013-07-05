class Tag < ActiveRecord::Base
  attr_accessible :photo_id, :title, :author_id
  
  validates :title, :uniqueness => true
  
  belongs_to :photo
  belongs_to :author,
  :class_name => "User"
  
end
