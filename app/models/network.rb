class Network < ActiveRecord::Base
  has_many :network_memberships
  has_many :users, :through => :network_memberships
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Address'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  belongs_to :city
  belongs_to :state
  
  define_index do
    indexes :name
    indexes city(:name), :as => :city_name
    indexes state(:name), :as => :state_name
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
end
