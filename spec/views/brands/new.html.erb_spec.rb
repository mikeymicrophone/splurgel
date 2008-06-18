require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/new.html.erb" do
  include BrandsHelper
  
  before(:each) do
    @brand = mock_model(Brand)
    @brand.stub!(:new_record?).and_return(true)
    @brand.stub!(:name).and_return("MyString")
    @brand.stub!(:phone).and_return("MyString")
    assigns[:brand] = @brand
  end

  it "should render new form" do
    render "/brands/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", brands_path) do
      with_tag("input#brand_name[name=?]", "brand[name]")
      with_tag("input#brand_phone[name=?]", "brand[phone]")
    end
  end
end


