class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  has_many :address_uses
  has_many :users, :through => :address_uses, :source => :user, :conditions => "address_uses.target_type = 'User'"
  #has_many :locations, :through => :address_uses, :source => :locations, :conditions => "address_uses.target_type = 'Location'"
  has_many :stores, :through => :address_uses, :source => :stores, :conditions => "address_uses.target_type = 'Store'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Address'"
  has_many :comments, :as => :target
end
