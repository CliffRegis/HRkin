class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :votes , dependent: :destroy

<<<<<<< HEAD
 searchable do
    text :title, :boost => 5
    text :content
      
=======
  searchable do
    text :title, :boost => 5
    text :content
>>>>>>> master
  end

  def points
    votes.sum(:value).to_i
  end

end