class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true
  # address, address_use, brand, city, comment, credit_card, following, group, image, image_use, listing, location, membership, message
  # network, network_membership, offering, price, product, purchase, schedule, state, store, tag, tagging, user, website, website_use
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Comment'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Comment'"
  has_many :comments, :as => :target
end
