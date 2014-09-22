class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
   scope :reverse_relationships, ->(followers) { where user_id: followers }
    belongs_to :topic

  searchable do
    text :title, :boost => 5
    text :content
    text :comments do
      comments.map(&:content)
    end 
   
  end

  def up_votes
    votes.where(value: 1).count
  end

   def down_votes
     votes.where(value: -1).count
   end
   
   def points
     self.votes.sum(:value).to_i
   end

   


  default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) {user ? all : joins(topic).where('topics.public' => true)}

  validates :title, length: {minimum: 5}, presence: true
  validates :content, length: {minimum: 20}, presence: true
  
end

private

  def create_vote
    user.votes.create(value: 1, post:self)
  end
  
