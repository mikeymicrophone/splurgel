require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/edit.html.erb" do
  include BrandsHelper
  
  before do
    @brand = mock_model(Brand)
    @brand.stub!(:name).and_return("MyString")
    @brand.stub!(:phone).and_return("MyString")
    assigns[:brand] = @brand
  end

  it "should render edit form" do
    render "/brands/edit.html.erb"
    
    response.should have_tag("form[action=#{brand_path(@brand)}][method=post]") do
      with_tag('input#brand_name[name=?]', "brand[name]")
      with_tag('input#brand_phone[name=?]', "brand[phone]")
    end
  end
end


