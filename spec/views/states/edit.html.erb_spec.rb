require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/edit.html.erb" do
  include StatesHelper
  
  before do
    @state = mock_model(State)
    @state.stub!(:name).and_return("MyString")
    assigns[:state] = @state
  end

  it "should render edit form" do
    render "/states/edit.html.erb"
    
    response.should have_tag("form[action=#{state_path(@state)}][method=post]") do
      with_tag('input#state_name[name=?]', "state[name]")
    end
  end
end


