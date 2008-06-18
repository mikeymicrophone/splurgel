require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/networks/index.html.erb" do
  include NetworksHelper
  
  before(:each) do
    network_98 = mock_model(Network)
    network_98.should_receive(:name).and_return("MyString")
    network_98.should_receive(:city_id).and_return("1")
    network_98.should_receive(:state_id).and_return("1")
    network_99 = mock_model(Network)
    network_99.should_receive(:name).and_return("MyString")
    network_99.should_receive(:city_id).and_return("1")
    network_99.should_receive(:state_id).and_return("1")

    assigns[:networks] = [network_98, network_99]
  end

  it "should render list of networks" do
    render "/networks/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

