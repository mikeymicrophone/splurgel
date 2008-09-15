class Stock < ActiveRecord::Base
  belongs_to :offering
  belongs_to :style
  belongs_to :user
  
  def price
    offering.price
  end
end
