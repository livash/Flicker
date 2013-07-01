class Photo < ActiveRecord::Base
  attr_accessible :binary_data, :content_type, :description, :owner_id, :title, :data
  
  belongs_to :owner,
  :class_name => "User"
  
  has_many :comments
  has_many :tags

end
