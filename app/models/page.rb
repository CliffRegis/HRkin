class Page < ActiveRecord::Base
  has_many :collaborators
  has_many :users, through: :collaborators
  
  scope :order_by_created_at, -> { order('created_at DESC') }
  

   
end
