class Todoo < ActiveRecord::Base

  def countdown
   created_at + 7.days
  end

end
