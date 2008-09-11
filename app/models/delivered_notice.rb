class DeliveredNotice < ActiveRecord::Base
  belongs_to :notice
  belongs_to :user
  
  def display
    notice.body
  end
end
