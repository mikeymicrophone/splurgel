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
    indexes product(:name)
    indexes brand(:name)
    indexes store(:name)
    indexes tags(:name)
    indexes comments(:body)
  end
  
  def self.list_types
    {'like' => 1, 'want' => 2, 'have' => 3, 1 => 'like', 2 => 'want', 3 => 'have'}
  end
end
