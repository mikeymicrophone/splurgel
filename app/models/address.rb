require 'open-uri'
class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :user
  has_many :address_uses
  has_many :users, :through => :address_uses, :source => :user, :conditions => "address_uses.target_type = 'User'"
  # Location actually has a foreign key address_id because it is such an intrinsic part of the model.. however may be better to handle it through address_uses
  has_many :locations#, :through => :address_uses, :source => :locations, :conditions => "address_uses.target_type = 'Location'"
  #has_many :headquartered_stores, :through => :address_uses, :source => :store#, :conditions => "address_uses.target_type = 'Store'"
  has_many :located_stores, :through => :locations, :source => :store
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  serialize :primary_photos, Array
  before_create :ensure_line_1, :ensure_city
  validates_presence_of :street
  attr_accessor :city_name, :state_name

  define_index do
    indexes city.name, :as => :city_name
    indexes state.name, :as => :state_name
   # indexes stores.name, :as => :store_names
    indexes :street
    indexes :street2
    indexes :name
    indexes :alternate_names

  end

  def headquartered_stores
    address_uses.all(:conditions => {:target_type => 'Store'}).map(&:store)
  end

  def stores
    headquartered_stores + located_stores
  end
  
  # before_save :geocode
  
  def geocode
    st = street.gsub(' ', '+') if street
    ct = city.name.gsub(' ', '+') if city
    stat = state.name.gsub(' ', '+') if state
    address_query = "street=#{st}&city=#{ct}&state=#{stat}&zip=#{zip}"
    geo_doc = open("http://local.yahooapis.com/MapsService/V1/geocode?appid=#{YGEO}&#{address_query}").read
    geo_doc =~ /<Latitude>([\d\-\.]*)<\/Latitude><Longitude>([\d\-\.]*)<\/Longitude>/
    self.latitude, self.longitude = $1, $2
    # maybe fall back to this after yahoo daily limit reached "http://geocoder.us/service/rest?address="
  end
  
  def display
    address = ''
    address += street + ' ' unless street.blank?
    address += street2 + ' ' unless street2.blank?
    address += city.name if city
    address += ', ' if city && state
    address += state.name if state
    address += ', ' + zip.to_s if zip
  end
  
  def name
    (street ? street + ' ' : '') + (street2 ? street2 : '')
  end
  
  def ensure_line_1
    if street.blank? && !street2.blank?
      street = street2
      street2 = ''
    end
  end
  
  def ensure_city
    ensure_state
    self.city = City.find_or_create_by_name_and_state_id(city_name, state_id)
    true
  end
  
  def ensure_state
    self.state = State.find_or_create_by_name(state_name)
  end
end
