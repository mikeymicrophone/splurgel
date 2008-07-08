class Listing < ActiveRecord::Base
  belongs_to :product
  belongs_to :brand
  belongs_to :store
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  serialize :primary_photos, Array
  
  def self.list_types
    {'like' => 1, 'want' => 2, 'have' => 3}
  end
end
