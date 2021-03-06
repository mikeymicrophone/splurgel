class Brand < ActiveRecord::Base
  has_many :products
  has_many :offerings, :through => :products
  has_many :listings
  has_many :image_uses, :as => :target
  has_many :images, :through => :image_uses, :source => :image, :conditions => "image_uses.target_type = 'Brand'"
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Address'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Brand' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Brand' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Brand' and followings.follower_type = 'Location'"
  has_many :notices, :as => :followed
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes products(:name), :as => :product_name
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
  
  def stores
    products.map(&:offerings).flatten.map(&:location).uniq.map(&:store).uniq
  end
  
  def phone
    phones.first.number if phones.first
  end
  
  def self.most_wanted
    Listing.find_all_by_list_type(2).select(&:brand_id).group_by(&:brand).first.first
  end
  
  def self.most_liked
    Listing.find_all_by_list_type(1).select(&:brand_id).group_by(&:brand).first.first
  end
  
  def self.most_owned
    Listing.find_all_by_list_type(3).select(&:brand_id).group_by(&:brand).first.first
  end
end
