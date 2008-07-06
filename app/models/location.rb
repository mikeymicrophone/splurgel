class Location < ActiveRecord::Base
  belongs_to :store
  belongs_to :schedule
  belongs_to :address
  has_many :offerings
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Location'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Location'"
  has_many :comments, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'Location'", :as => :target
  serialize :primary_photos, Array
    
  def name
    nm = ''
    nm += store.name if store
    nm += ' of ' if store && (address.street && !address.street.blank?)
    nm += address.street
  end
end
