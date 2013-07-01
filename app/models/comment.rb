class Comment < ActiveRecord::Base
  attr_accessible :author_id, :body, :photo_id
  
  belongs_to :author,
  :class_name => "User"
  
  belongs_to :photo
end
