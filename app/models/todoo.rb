class Todoo < ActiveRecord::Base

  def countdown
    (7 - (Date.today - created_at.to_date)).to_i
   # created_at + 7.days
  end

end
