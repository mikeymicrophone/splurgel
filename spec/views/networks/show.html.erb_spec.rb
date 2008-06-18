require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/networks/show.html.erb" do
  include NetworksHelper
  
  before(:each) do
    @network = mock_model(Network)
    @network.stub!(:name).and_return("MyString")
    @network.stub!(:city_id).and_return("1")
    @network.stub!(:state_id).and_return("1")

    assigns[:network] = @network
  end

  it "should render attributes in <p>" do
    render "/networks/show.html.erb"
    response.should have_text(/MyString/)
  end
end

