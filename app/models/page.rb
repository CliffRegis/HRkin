class Page < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  scope :order_by_created_at, -> { order('created_at DESC') }

end
