class Listing < ActiveRecord::Base
  belongs_to :product
  belongs_to :brand
  belongs_to :store
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  serialize :primary_photos, Array
  
  define_index do
    indexes product(:name), :as => :product
    indexes brand(:name), :as => :brand
    indexes store(:name), :as => :store
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
  
  def primary
    product || brand || store
  end
  
  def self.list_types
    {'like' => 1, 'want' => 2, 'have' => 3, 1 => 'like', 2 => 'want', 3 => 'have'}
  end
  
  def name
    "#{primary.name} on #{user.login}'s #{Listing.list_types[list_type]} list"
  end
end
