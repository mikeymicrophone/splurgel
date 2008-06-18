require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/new.html.erb" do
  include CitiesHelper
  
  before(:each) do
    @city = mock_model(City)
    @city.stub!(:new_record?).and_return(true)
    @city.stub!(:name).and_return("MyString")
    @city.stub!(:state_id).and_return("1")
    assigns[:city] = @city
  end

  it "should render new form" do
    render "/cities/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", cities_path) do
      with_tag("input#city_name[name=?]", "city[name]")
    end
  end
end


