class DeliveredNotice < ActiveRecord::Base
  belongs_to :notice
  belongs_to :user
  named_scope :unread, :conditions => {:read_at => nil}
  named_scope :undismissed, :conditions => {:dismissed_at => nil}
  
  def display
    notice.body
  end
end
