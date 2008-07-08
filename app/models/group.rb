class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Group'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'Location'", :as => :target
  belongs_to :administrator, :class_name => 'User', :foreign_key => :administrator_id
  serialize :primary_photos, Array
end
