class Post < ActiveRecord::Base
 
  has_many :comments, dependent: :destroy, as: :commentable
  has_many :votes, dependent: :destroy
  belongs_to :user
  scope :reverse_relationships, ->(followers) { where user_id: followers }
  belongs_to :topic
    mount_uploader :image, ImageUploader
    
  # validates :content, length: {minimum: 20}, presence: true
  # searchable do

  #   text :title, :boost => 5
  #   text :content
  #   text :comments do
  #     comments.map(&:content)
  #   end 
  #   integer :topic_id do
  #     topic.id 
  #   end
  #  end

  def up_votes
    votes.where(value: 1).count
  end

   def down_votes
     votes.where(value: -1).count
   end
   
   def points
     self.votes.sum(:value).to_i
   end

   def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 *24)
    new_rank = points + age
    update_attribute(:rank, new_rank)
   end


  default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) {user ? all : joins(topic).where('topics.public' => true)}

  validates :title, length: {minimum: 5}, presence: true

  private

  def create_vote
    user.votes.create(value: 1, post:self)
  end 
  
end