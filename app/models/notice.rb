class Notice < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true
  belongs_to :followed, :polymorphic => true
  has_many :delivered_notices
  
  def deliver_notices
    followed.followers.each { |f| notify f }
  end
  
  def notify follower
    DeliveredNotice.create(:notice_id => id, :user_id => follower.id)
  end
end
