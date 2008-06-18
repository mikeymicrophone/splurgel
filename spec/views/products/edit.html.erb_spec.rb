require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/edit.html.erb" do
  include ProductsHelper
  
  before do
    @product = mock_model(Product)
    @product.stub!(:name).and_return("MyString")
    @product.stub!(:brand_id).and_return("1")
    assigns[:product] = @product
  end

  it "should render edit form" do
    render "/products/edit.html.erb"
    
    response.should have_tag("form[action=#{product_path(@product)}][method=post]") do
      with_tag('input#product_name[name=?]', "product[name]")
    end
  end
end


