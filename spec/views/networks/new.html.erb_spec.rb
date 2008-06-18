require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/networks/new.html.erb" do
  include NetworksHelper
  
  before(:each) do
    @network = mock_model(Network)
    @network.stub!(:new_record?).and_return(true)
    @network.stub!(:name).and_return("MyString")
    @network.stub!(:city_id).and_return("1")
    @network.stub!(:state_id).and_return("1")
    assigns[:network] = @network
  end

  it "should render new form" do
    render "/networks/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", networks_path) do
      with_tag("input#network_name[name=?]", "network[name]")
    end
  end
end


