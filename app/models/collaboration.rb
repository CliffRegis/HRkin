class Collaboration < ActiveRecord::Base
  belongs_to :supporter, class_name: "User"
  belongs_to :supported, class_name: "User"
  validates :supported_id, presence: true
  validates :supporter_id, presence: true
end
