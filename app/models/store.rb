class Store < ActiveRecord::Base
  has_many :locations
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Store'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :offerings, :through => :locations
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Store' and followings.follower_type = 'Location'", :as => :target
  belongs_to :administrator, :class_name => 'User', :foreign_key => :administrator_id
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes tags(:name), :as => :tags
    indexes comments(:name), :as => :comments
    set_property :delta => true
  end
  
  def products
    offerings.map &:product
  end
  
  def brands
    products.map(&:brand).uniq
  end
  
  def prices
    products.map &:price
  end
end
