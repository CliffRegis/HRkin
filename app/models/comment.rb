class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :commentable, polymorphic: true
  validates :content, length: { minimum: 5 }
end
