class Page < ActiveRecord::Base
  has_many :collaborators
  has_many :users, through: :collaborations
  # has_many :active_collaborations, class_name: "Collaboration",
  #                                   # foreign_key: "supporter_id",
  #                                   dependent: :destroy
  # has_many :passive_collaborations, class_name: "Collaboration",
  #                                   # foreign_key: "supported_id",
  #                                   dependent: :destroy                                 
  # has_many :supporting, through: :active_collaborations, source: :supported
  # has_many :supporters, through: :passive_collaborations, source: :supporter
  scope :order_by_created_at, -> { order('created_at DESC') }
   
end
