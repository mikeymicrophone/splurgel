require 'open-uri'
class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  has_many :address_uses
  has_many :users, :through => :address_uses, :source => :user, :conditions => "address_uses.target_type = 'User'"
  # Location actually has a foreign key address_id because it is such an intrinsic part of the model.. however may be better to handle it through address_uses
  # has_many :locations, :through => :address_uses, :source => :locations, :conditions => "address_uses.target_type = 'Location'"
  has_many :stores, :through => :address_uses, :source => :stores, :conditions => "address_uses.target_type = 'Store'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  serialize :primary_photos, Array

  acts_as_ferret :fields => [:name, :alternate_names, :street, :street2]
  
  before_save :geocode
  
  def geocode
    st = street.gsub(' ', '+')
    ct = city.name.gsub(' ', '+')
    stat = state.name.gsub(' ', '+')
    address_query = "street=#{st}&city=#{ct}&state=#{stat}&zip=#{zip}"
    geo_doc = open("http://local.yahooapis.com/MapsService/V1/geocode?appid=#{YGEO}&#{address_query}").read
    geo_doc =~ /<Latitude>([\d\-\.]*)<\/Latitude><Longitude>([\d\-\.]*)<\/Longitude>/
    self.latitude, self.longitude = $1, $2
    # maybe fall back to this after yahoo daily limit reached "http://geocoder.us/service/rest?address="
  end
  
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
