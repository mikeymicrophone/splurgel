class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :target, :polymorphic => true
  
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  def store
    target_type == 'Store' ? Store.find(target_id) : nil
  end
  
  def self.targets
    ['User', 'Location', 'Brand', 'Store', 'Group', 'Network']
  end
  
  def name
    (target.respond_to?(:name) ? target.name + ' at ' : 'use of ') + (address.name.blank? ? address.street : address.name)
  end
end
