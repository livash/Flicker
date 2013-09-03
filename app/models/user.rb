class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :email, :presence => true
  
  before_validation :ensure_username_has_a_value

  has_many :albums, :dependent => :destroy
  
  has_one :gallery

  has_many :photos,
  :foreign_key => :owner_id,
  :dependent => :destroy

  has_many :comments,
  :foreign_key => :author_id,
  :dependent => :destroy

  has_many :tags,
  :foreign_key => :author_id,
  :dependent => :destroy
  
  protected
  def ensure_username_has_a_value
    if self.username.nil?
      self.username = self.email.split("@").first
    end
  end
end
