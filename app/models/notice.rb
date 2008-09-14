class Notice < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true
  belongs_to :followed, :polymorphic => true
  has_many :delivered_notices
  has_many :users, :through => :delivered_notices
  after_create :deliver_notices
  serialize :secondary_targets, Array
  
  def add_target this_target
    if secondary_targets.blank?
      secondary_targets = [[this_target.class.name, this_target.id]]
    else
      secondary_targets << [this_target.class.name, this_target.id]
    end
    save
  end
  
  def deliver_notices
    followed.followers.each { |f| deliver_notice_to f } if followed.respond_to?(:followers)
  end
  
  def deliver_notice_to follower
    DeliveredNotice.create :notice_id => id, :user_id => follower.id
  end

end
