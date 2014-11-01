class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
   has_many :votes 


  def points
    votes.sum(:value).to_i
  end

end