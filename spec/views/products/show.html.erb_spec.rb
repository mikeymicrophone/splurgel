require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/show.html.erb" do
  include ProductsHelper
  
  before(:each) do
    @product = mock_model(Product)
    @product.stub!(:name).and_return("MyString")
    @product.stub!(:brand_id).and_return("1")

    assigns[:product] = @product
  end

  it "should render attributes in <p>" do
    render "/products/show.html.erb"
    response.should have_text(/MyString/)
  end
end

