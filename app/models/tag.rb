class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :particular_taggings, :class_name => 'Tagging', :as => :target # test me
  has_many :tags, :through => :particular_taggings, :source => :tag, :conditions => "taggings.target_type = 'Tag'"
  has_many :comments, :as => :target
  has_many :addresses, :through => :taggings, :source => :address, :conditions => "taggings.target_type = 'Address'"
  has_many :address_uses, :through => :taggings, :source => :address_use, :conditions => "taggings.target_type = 'Address_use'"
  has_many :brands, :through => :taggings, :source => :brand, :conditions => "taggings.target_type = 'Brand'"
  has_many :cities, :through => :taggings, :source => :city, :conditions => "taggings.target_type = 'City'"
  has_many :comments, :through => :taggings, :source => :comment, :conditions => "taggings.target_type = 'Comment'"
  has_many :followings, :through => :taggings, :source => :following, :conditions => "taggings.target_type = 'Following'"
  has_many :groups, :through => :taggings, :source => :group, :conditions => "taggings.target_type = 'Group'"
  has_many :images, :through => :taggings, :source => :image, :conditions => "taggings.target_type = 'Image'"
  has_many :image_uses, :through => :taggings, :source => :image_use, :conditions => "taggings.target_type = 'Image_use'"
  has_many :listings, :through => :taggings, :source => :listing, :conditions => "taggings.target_type = 'Listing'"
  has_many :locations, :through => :taggings, :source => :location, :conditions => "taggings.target_type = 'Location'"
  has_many :memberships, :through => :taggings, :source => :membership, :conditions => "taggings.target_type = 'Membership'"
  has_many :messages, :through => :taggings, :source => :message, :conditions => "taggings.target_type = 'Message'"
  has_many :networks, :through => :taggings, :source => :network, :conditions => "taggings.target_type = 'Network'"
  has_many :network_memberships, :through => :taggings, :source => :network_membership, :conditions => "taggings.target_type = 'Network_membership'"
  has_many :offerings, :through => :taggings, :source => :offering, :conditions => "taggings.target_type = 'Offering'"
  has_many :prices, :through => :taggings, :source => :price, :conditions => "taggings.target_type = 'Price'"
  has_many :products, :through => :taggings, :source => :product, :conditions => "taggings.target_type = 'Product'"
  has_many :purchases, :through => :taggings, :source => :purchase, :conditions => "taggings.target_type = 'Purchase'"
  has_many :schedules, :through => :taggings, :source => :schedule, :conditions => "taggings.target_type = 'Schedule'"
  has_many :states, :through => :taggings, :source => :state, :conditions => "taggings.target_type = 'State'"
  has_many :stores, :through => :taggings, :source => :store, :conditions => "taggings.target_type = 'Store'"
  has_many :users, :through => :taggings, :source => :user, :conditions => "taggings.target_type = 'User'"
  has_many :websites, :through => :taggings, :source => :website, :conditions => "taggings.target_type = 'Website'"
  has_many :website_uses, :through => :taggings, :source => :website_use, :conditions => "taggings.target_type = 'Website_use'"
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Tag' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Tag' and followings.follower_type = 'Group'"
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Tag' and followings.follower_type = 'Location'"
  
  #acts_as_ferret :fields => [:name]
  
  def targets
    addresses + address_uses + brands + cities + comments + followings + groups + images + image_uses +
    listings + locations + memberships + messages + networks + network_memberships + offerings + prices + products +
    purchases + schedules + states + stores + users + websites + website_uses    
  end
end
