require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/index.html.erb" do
  include ProductsHelper
  
  before(:each) do
    product_98 = mock_model(Product)
    product_98.should_receive(:name).and_return("MyString")
    product_98.should_receive(:brand_id).and_return("1")
    product_99 = mock_model(Product)
    product_99.should_receive(:name).and_return("MyString")
    product_99.should_receive(:brand_id).and_return("1")

    assigns[:products] = [product_98, product_99]
  end

  it "should render list of products" do
    render "/products/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

