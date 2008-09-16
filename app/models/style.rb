class Style < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :stocks
  has_many :offerings, :through => :stocks
  
  # def offerings
  #   stocks.map(&:offering).uniq
  # end
  
  define_index do
    indexes :traits
    indexes :size
    indexes product(:name), :as => :product
    set_property :delta => true
  end

  def display_for_select
    (traits.blank? ? '' : traits) + (size.blank? ? '' : " (#{size})")
  end
  
  def name
    traits
  end

end
