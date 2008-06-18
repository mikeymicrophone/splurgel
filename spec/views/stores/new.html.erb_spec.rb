require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stores/new.html.erb" do
  include StoresHelper
  
  before(:each) do
    @store = mock_model(Store)
    @store.stub!(:new_record?).and_return(true)
    @store.stub!(:name).and_return("MyString")
    @store.stub!(:administrator_id).and_return("1")
    @store.stub!(:primary_image_id).and_return("1")
    assigns[:store] = @store
  end

  it "should render new form" do
    render "/stores/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", stores_path) do
      with_tag("input#store_name[name=?]", "store[name]")
    end
  end
end


