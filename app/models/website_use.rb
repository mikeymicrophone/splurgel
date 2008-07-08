class WebsiteUse < ActiveRecord::Base
  belongs_to :website
  belongs_to :target, :polymorphic => true
  # brand, city, comment, group, image, location, message, network, offering, product, state, store, tagging, user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
end
