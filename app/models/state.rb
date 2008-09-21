class State < ActiveRecord::Base
  has_many :cities
  has_many :addresses
  has_many :networks
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes cities(:name), :as => :cities
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
  
  def self.find_or_create_by_name name_or_abbreviation
    state = find_by_name name_or_abbreviation
    state ||= (name_or_abbreviation.length == 2 ? create(:abbreviation => name_or_abbreviation.upcase) : create(:name => name_or_abbreviation))
    state
  end
  
  def self.find_by_name name_or_abbreviation
    state = find(:first, :conditions => {:name => name_or_abbreviation})
    state ||= find(:first, :conditions => {:abbreviation => name_or_abbreviation})
    state ||= find(:first, :conditions => {:abbreviation => name_or_abbreviation.upcase})
    state
  end
end
