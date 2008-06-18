require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/show.html.erb" do
  include StatesHelper
  
  before(:each) do
    @state = mock_model(State)
    @state.stub!(:name).and_return("MyString")

    assigns[:state] = @state
  end

  it "should render attributes in <p>" do
    render "/states/show.html.erb"
    response.should have_text(/MyString/)
  end
end

