require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/new.html.erb" do
  include StatesHelper
  
  before(:each) do
    @state = mock_model(State)
    @state.stub!(:new_record?).and_return(true)
    @state.stub!(:name).and_return("MyString")
    assigns[:state] = @state
  end

  it "should render new form" do
    render "/states/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", states_path) do
      with_tag("input#state_name[name=?]", "state[name]")
    end
  end
end


