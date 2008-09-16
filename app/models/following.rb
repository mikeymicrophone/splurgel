class Following < ActiveRecord::Base
  belongs_to :follower, :polymorphic => true
  # group, user, location
  belongs_to :target, :polymorphic => true
 
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  belongs_to :group, :foreign_key => :follower_id
  belongs_to :location, :foreign_key => :follower_id
  belongs_to :followed_user, :class_name => 'User', :foreign_key => :follower_id
  belongs_to :user
  after_create :notify_user, :notify_target
  
  def notify_user
    user.make_known("now following #{target.name}.", [self, target])
  end
  
  def notify_target
    target.make_known("#{user.login} is now following.", [self, user])
  end
  
  def self.targets
    ['User', 'Brand', 'Store', 'Location', 'Group', 'City', 'Product', 'Offering', 'Comment', 'Membership', 'Tag', 'Website']
  end

  def name
    "#{user.login} following #{target.name}"
  end

end
