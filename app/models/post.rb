class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
    belongs_to :topic
  default_scope { order('created_at DESC') }
  
  validates :title, length: {minimum: 5}, presence: true
  validates :content, length: {minimum: 20}, presence: true
  
end