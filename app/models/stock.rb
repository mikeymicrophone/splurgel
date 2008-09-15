class Stock < ActiveRecord::Base
  belongs_to :offering
  belongs_to :style
  belongs_to :user
  
  def price
    offering.price
  end
  
  def self.find_by_product_and_location prod, loc
    return nil if prod.nil? || loc.nil?
    prod = prod.id if prod.is_a?(Product)
    loc = loc.id if loc.is_a?(Location)
    off = Offering.find_by_location_id_and_product_id(loc, prod)
    off.stocks if off
  end
end
