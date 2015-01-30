class Todoo < ActiveRecord::Base

 belongs_to :user
 
  def countdown
    (7 - (Date.today - created_at.to_date)).to_i
  end

end
