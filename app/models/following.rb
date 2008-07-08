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
  
  def self.targets
    ['User', 'Brand', 'Store', 'Location', 'Group', 'City', 'Product', 'Offering', 'Comment', 'Membership', 'Tag', 'Website']
  end


end
