class City < ActiveRecord::Base
  belongs_to :state
  has_many :addresses
  has_many :locations, :through => :addresses
  has_many :networks
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'City' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'City' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'City' and followings.follower_type = 'Location'"
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    indexes state(:name), :as => :state_name
    set_property :delta => true
  end
end
