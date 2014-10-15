class Todoo < ActiveRecord::Base

  def countdown
    (7 - (Date.today - created_at.to_date)).to_i
  end

end
