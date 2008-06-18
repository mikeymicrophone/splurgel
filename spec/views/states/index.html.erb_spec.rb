require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/index.html.erb" do
  include StatesHelper
  
  before(:each) do
    state_98 = mock_model(State)
    state_98.should_receive(:name).and_return("MyString")
    state_99 = mock_model(State)
    state_99.should_receive(:name).and_return("MyString")

    assigns[:states] = [state_98, state_99]
  end

  it "should render list of states" do
    render "/states/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

