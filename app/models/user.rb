class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  

  has_many :posts, dependent: :destroy
    
  has_many :pages
  has_many :todoos
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :collaborations
  has_many :page_collaborations, through: :collaborations, source: :page
  

  def handle
    username || email
  end
  
  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  popular 
end