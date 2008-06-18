class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :target, :polymorphic => true
  # user, location, brand, store, group(?), network(?)
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'AddressUse'"
  has_many :comments, :as => :target
end
