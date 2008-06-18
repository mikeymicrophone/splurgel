class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :offering
  belongs_to :credit_card
  belongs_to :address
  belongs_to :product, :through => :offering
  belongs_to :location, :through => :offering
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Purchase'"
  has_many :comments, :as => :target
  
  def store
    location.store
  end
end
