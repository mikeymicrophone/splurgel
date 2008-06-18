require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/show.html.erb" do
  include BrandsHelper
  
  before(:each) do
    @brand = mock_model(Brand)
    @brand.stub!(:name).and_return("MyString")
    @brand.stub!(:phone).and_return("MyString")

    assigns[:brand] = @brand
  end

  it "should render attributes in <p>" do
    render "/brands/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

