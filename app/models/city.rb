class City < ActiveRecord::Base
  belongs_to :state
  has_many :addresses
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'City'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'City'"
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'City' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'City' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'City' and followings.follower_type = 'Location'"
  serialize :primary_photos, Array
end
