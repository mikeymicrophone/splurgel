require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/edit.html.erb" do
  include CitiesHelper
  
  before do
    @city = mock_model(City)
    @city.stub!(:name).and_return("MyString")
    @city.stub!(:state_id).and_return("1")
    assigns[:city] = @city
  end

  it "should render edit form" do
    render "/cities/edit.html.erb"
    
    response.should have_tag("form[action=#{city_path(@city)}][method=post]") do
      with_tag('input#city_name[name=?]', "city[name]")
    end
  end
end


