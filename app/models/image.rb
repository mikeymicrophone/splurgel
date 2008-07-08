class Image < ActiveRecord::Base
  has_many :image_uses
  has_many :brands, :through => :image_uses, :source => :brand, :conditions => "image_uses.target_type = 'Brand'"
  has_many :addresses, :through => :image_uses, :source => :address, :conditions => "image_uses.target_type = 'Address'"
  has_many :cities, :through => :image_uses, :source => :city, :conditions => "image_uses.target_type = 'City'"
  has_many :listings, :through => :image_uses, :source => :listing, :conditions => "image_uses.target_type = 'Listing'"
  has_many :groups, :through => :image_uses, :source => :group, :conditions => "image_uses.target_type = 'Group'"
  has_many :comments, :through => :image_uses, :source => :comment, :conditions => "image_uses.target_type = 'Comment'"
  has_many :locations, :through => :image_uses, :source => :location, :conditions => "image_uses.target_type = 'Location'"
  has_many :offerings, :through => :image_uses, :source => :offering, :conditions => "image_uses.target_type = 'Offering'"
  has_many :products, :through => :image_uses, :source => :product, :conditions => "image_uses.target_type = 'Product'"
  has_many :states, :through => :image_uses, :source => :state, :conditions => "image_uses.target_type = 'State'"
  has_many :stores, :through => :image_uses, :source => :store, :conditions => "image_uses.target_type = 'Store'"
  has_many :taggings, :through => :image_uses, :source => :tagging, :conditions => "image_uses.target_type = 'Tagging'"
  has_many :users, :through => :image_uses, :source => :user, :conditions => "image_uses.target_type = 'User'"
  has_many :websites, :through => :image_uses, :source => :website, :conditions => "image_uses.target_type = 'Website'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  
  has_attachment :storage => :s3
end
