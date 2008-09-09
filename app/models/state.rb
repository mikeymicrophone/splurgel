class State < ActiveRecord::Base
  has_many :cities
  has_many :addresses
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes cities(:name)
    indexes tags(:name)
    indexes comments(:body)
  end
end
