class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :target, :polymorphic => true
  # address, address_use, brand, city, comment, following, group, image, image_use, listing, location
  # membership, message, network, network_membership, offering, price, product, purchase, (schedule?)
  # state, store, (tag?), user, website, website_use
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Tagging'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Tagging'"
  has_many :comments, :as => :target
end
