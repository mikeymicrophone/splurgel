require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/new.html.erb" do
  include ProductsHelper
  
  before(:each) do
    @product = mock_model(Product)
    @product.stub!(:new_record?).and_return(true)
    @product.stub!(:name).and_return("MyString")
    @product.stub!(:brand_id).and_return("1")
    assigns[:product] = @product
  end

  it "should render new form" do
    render "/products/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", products_path) do
      with_tag("input#product_name[name=?]", "product[name]")
    end
  end
end


