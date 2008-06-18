class Offering < ActiveRecord::Base
  belongs_to :product
  belongs_to :location
  has_many :prices
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Offering'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Offering'"
  has_many :comments, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'Location'"
end