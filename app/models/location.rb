class Location < ActiveRecord::Base
  belongs_to :store
  belongs_to :schedule
  belongs_to :address
  belongs_to :user
  has_many :offerings
  has_many :products, :through => :offerings
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  belongs_to :primary_phone, :class_name => 'Phone'
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Location' and followings.follower_type = 'Location'", :as => :target
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  after_create :notify_store
  
  define_index do
    indexes :name
    indexes store(:name)
    indexes taggings(:name)
    indexes comments(:body)
  end
  
  def notify_store
    store.make_known("#{store.name} has a new location in #{address.city.name}.", self)
  end
  
     # also an attribute called name now
  def name
    nm = ''
    nm += store.name if store
    nm += ' of ' if store && (address.street && !address.street.blank?)
    nm += address.street if address
  end
end
