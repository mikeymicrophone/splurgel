class Store < ActiveRecord::Base
  has_many :locations
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Store'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Store'"
  has_many :comments, :as => :target
  has_many :offerings, :through => :locations
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'Location'", :as => :target
  belongs_to :administrator, :class_name => 'User', :foreign_key => :administrator_id
  serialize :primary_photos, Array
  
  def products
    offerings.map &:product
  end
  
  def prices
    products.map &:price
  end
end
