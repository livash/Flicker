class Photo < ActiveRecord::Base
  attr_accessible :data, :content_type, :description, :owner_id, :title, :data, :image

  belongs_to :owner,
  :class_name => "User"

  has_many :album_photos, :dependent => :destroy
  has_many :albums, :through => :album_photos, :source => :album

  has_many :comments, :dependent => :destroy
  has_many :tags, :dependent => :destroy

  has_attached_file :image, :styles => {
    # thumb: '100x100>',
    # square: '200x200#',
    # medium: '300x300>'
    thumb: '220x200#'
   }

  def previous_next(album = nil, user_id)
    result = [self, self]
    album ? photos = album.photos : photos = Photo.where(:owner_id => user_id)
    puts photos.count
    photos.each_with_index do |p, idx|
      puts "In the loop"
      if self == photos[idx]
        if (idx > 0 and idx < photos.size - 1)
          result = [photos[idx - 1], photos[idx + 1]]
        elsif (idx == 0 and photos.size > 1)
          result = [photos.last, photos[idx + 1]]
        elsif (idx == photos.size - 1 and photos.size > 1)
          result = [photos[idx - 1], photos.first]
        end
      end
    end

    result
  end
end
