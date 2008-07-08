class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :target, :polymorphic => true
  
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  def self.targets
    ['User', 'Location', 'Brand', 'Store', 'Group', 'Network']
  end
end
