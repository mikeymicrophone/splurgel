class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :listings
  has_many :listers, :through => :listings, :class_name => 'User', :foreign_key => :user_id
  has_many :wanters, :through => :listings, :class_name => 'User', :foreign_key => :user_id, :conditions => 'listings.list_type = 1'
  has_many :owners, :through => :listings, :class_name => 'User', :foreign_key => :user_id, :conditions => 'listings.list_type = 2'
  has_many :likers, :through => :listings, :class_name => 'User', :foreign_key => :user_id, :conditions => 'listings.list_type = 3'
  has_many :offerings
  has_many :locations, :through => :offerings
  has_many :prices, :through => :offerings
  has_many :purchases, :conditions => "offering_id in (select id from offerings where product_id = #{id})" #not sure whether this will work
  has_many :purchasers, :through => :purchases, :class_name => 'User', :foreign_key => :user_id
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Product'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Product'"
  has_many :comments, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Product' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Product' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Product' and followings.follower_type = 'Location'"
  def stores
    locations.map &:store
  end
end
