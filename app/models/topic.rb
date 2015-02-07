class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
   

  # searchable do
  #   text :title, :boost => 5
  #   text :content
  # end

  def up_votes
    votes.where(value: 1).count
  end

   def down_votes
     votes.where(value: -1).count
   end
   
   def points
     self.votes.sum(:value).to_i
   end
   

end