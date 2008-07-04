class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  has_many :address_uses
  has_many :users, :through => :address_uses, :source => :user, :conditions => "address_uses.target_type = 'User'"
  # Location actually has a foreign key address_id because it is such an intrinsic part of the model.. however may be better to handle it through address_uses
  # has_many :locations, :through => :address_uses, :source => :locations, :conditions => "address_uses.target_type = 'Location'"
  has_many :stores, :through => :address_uses, :source => :stores, :conditions => "address_uses.target_type = 'Store'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Address'"
  has_many :comments, :as => :target
  
  def display
    address = ''
    address += street + ' '
    address += street2 + ' ' unless street2.blank?
    address += city.name if city
    address += ', ' if city && state
    address += state.name if state
    address += ', ' + zip.to_s if zip
  end
  
  def name
    street + ' ' + street2
  end
end
