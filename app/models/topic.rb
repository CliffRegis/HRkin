class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
   

  # searchable do
  #   text :title, :boost => 5
  #   text :content
  # end

  

end