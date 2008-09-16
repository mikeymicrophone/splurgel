class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Membership' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Membership' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Membership' and followings.follower_type = 'Location'"
  has_many :notices
  has_many :delivered_notices, :through => :notices
  after_create :notify_group
  
  define_index do
    indexes group(:name), :as => :group
    indexes user(:login), :as => :username
    indexes user(:name), :as => :user_name
    set_property :delta => true
  end
  
  def notify_group
    group.make_known("#{group.name} has a new member: #{user.name}.", self)
  end
  
  def name
    "#{user.login} in #{group.name}"
  end
  
end
