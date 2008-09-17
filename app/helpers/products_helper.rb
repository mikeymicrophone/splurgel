module ProductsHelper
  def low_price_link product
    link_to product.low_price.point, product.low_price.offering if product.low_price
  end
  
  def high_price_link product
    link_to product.high_price.point, product.high_price.offering if product.high_price
  end
end
