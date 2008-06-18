require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/networks/edit.html.erb" do
  include NetworksHelper
  
  before do
    @network = mock_model(Network)
    @network.stub!(:name).and_return("MyString")
    @network.stub!(:city_id).and_return("1")
    @network.stub!(:state_id).and_return("1")
    assigns[:network] = @network
  end

  it "should render edit form" do
    render "/networks/edit.html.erb"
    
    response.should have_tag("form[action=#{network_path(@network)}][method=post]") do
      with_tag('input#network_name[name=?]', "network[name]")
    end
  end
end


