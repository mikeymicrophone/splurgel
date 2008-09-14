class CreditCard < ActiveRecord::Base
  belongs_to :address
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  def name_or_four
    name.blank? ? last_four : name
  end
  
  def last_four
    card_number =~ /(\d\d\d\d)$/
    $1
  end
end
