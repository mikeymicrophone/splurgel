require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/show.html.erb" do
  include CitiesHelper
  
  before(:each) do
    @city = mock_model(City)
    @city.stub!(:name).and_return("MyString")
    @city.stub!(:state_id).and_return("1")

    assigns[:city] = @city
  end

  it "should render attributes in <p>" do
    render "/cities/show.html.erb"
    response.should have_text(/MyString/)
  end
end

