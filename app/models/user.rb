class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :collaborators
  has_many :pages, dependent: :destroy
  has_many :active_collaborations, class_name: "Collaboration",
                                    foreign_key: "supporter_id",
                                    dependent: :destroy
  has_many :passive_collaborations, class_name: "Collaboration",
                                    foreign_key: "supported_id",
                                    dependent: :destroy                                 
  has_many :supporting, through: :active_collaborations, source: :supported
  has_many :supporters, through: :passive_collaborations, source: :supporter

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


  def supporting?(other_user)
    supporting.include?(other_user)
  end

  def support!(other_user)
    active_collaborations.create!(supported_id: other_user.id)
  end

  def unsupport!(other_user)
    active_collaborations.find_by(supported_id: other_user.id).destroy
  end


  

  popular 
end