class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :photos,
  :foreign_key => :owner_id
  
  has_many :comments,
  :foreign_key => :author_id 
  
  has_many :tags,
  :foreign_key => :author_id
  
end