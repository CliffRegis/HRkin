class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
   has_many :votes , dependent: :destroy

 # searchable do
 #    text :title, :boost => 5
 #    text :content
      
 #  end

  def points
    votes.sum(:value).to_i
  end

end