class NetworkMembership < ActiveRecord::Base
  belongs_to :network
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  define_index do
    indexes network(:name), :as => :network
    indexes user(:login), :as => :username
    indexes user(:name), :as => :user_name
    set_property :delta => true
  end
  
  def name
    "#{user.name} in #{network.name}"
  end
end
