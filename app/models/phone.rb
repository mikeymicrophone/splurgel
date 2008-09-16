class Phone < ActiveRecord::Base
  belongs_to :user
  has_many :phone_uses
  has_many :users, :through => :phone_uses, :source => :user, :conditions => "phone_uses.target_type = 'User'"
  has_many :groups, :through => :phone_uses, :source => :group, :conditions => "phone_uses.target_type = 'Group'"
  has_many :brands, :through => :phone_uses, :source => :brand, :conditions => "phone_uses.target_type = 'Brand'"
  has_many :stores, :through => :phone_uses, :source => :store, :conditions => "phone_uses.target_type = 'Store'"
  has_many :locations, :through => :phone_uses, :source => :location, :conditions => "phone_uses.target_type = 'Location'"
  has_many :websites, :through => :phone_uses, :source => :website, :conditions => "phone_uses.target_type = 'Website'"
  has_many :cities, :through => :phone_uses, :source => :city, :conditions => "phone_uses.target_type = 'City'"
  has_many :addresses, :through => :phone_uses, :source => :address, :conditions => "phone_uses.target_type = 'Address'"

  define_index do
    indexes groups(:name), :as => :groups
    indexes brands(:name), :as => :brands
    indexes stores(:name), :as => :stores
    indexes cities(:name), :as => :cities
  end
  
  def is_used_by entity
    PhoneUse.create(:phone_id => id, :target_id => entity.id, :target_type => entity.class.name) unless !PhoneUse.find_by_phone_id_and_target_id_and_target_type(id, entity.id, entity.class.name).blank?
  end
end
