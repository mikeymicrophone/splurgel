class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply, :class_name => 'Comment'
  belongs_to :target, :polymorphic => true
  # address, address_use, brand, city, comment, credit_card, following, group, image, image_use, listing, location, membership, message
  # network, network_membership, offering, price, product, purchase, schedule, state, store, tag, tagging, user, website, website_use
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Comment' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Comment' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Comment' and followings.follower_type = 'Location'"
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  after_create :notify_target, :notify_of_reply

  define_index do
    indexes :body
    # indexes target(:name)
  end
  
  def notify_user
    user.make_known("commented on #{target.name}.", [self, target])
  end
  
  def notify_target
    target.make_known("#{user.login} commented", [self, user])
  end
  
  def notify_of_reply
    reply.make_known("#{user.login} replied", [self, reply]) if reply
  end

  def name
    user.name + '~' + created_at.strftime("%l:%M %A %b %e")
  end
end
