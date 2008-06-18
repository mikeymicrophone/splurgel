class Brand < ActiveRecord::Base
  has_many :products
  has_many :listings
  has_many :image_uses, :as => :target
  has_many :images, :through => :image_uses, :source => :image, :conditions => "image_uses.target_type = 'Brand'"
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Address'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Brand'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Brand'"
  has_many :comments, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Brand' and followings.follower_type = 'User'"
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Brand' and followings.follower_type = 'Group'"
end