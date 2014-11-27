class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  def up_vote?
    value == 1
  end

  def down_vote?
    value == -1
  end
  
 
  after_save :update_post

  private

  def update_post
    post.update_rank
  end
  
end