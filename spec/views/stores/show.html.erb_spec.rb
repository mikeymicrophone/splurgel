require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stores/show.html.erb" do
  include StoresHelper
  
  before(:each) do
    @store = mock_model(Store)
    @store.stub!(:name).and_return("MyString")
    @store.stub!(:administrator_id).and_return("1")
    @store.stub!(:primary_image_id).and_return("1")

    assigns[:store] = @store
  end

  it "should render attributes in <p>" do
    render "/stores/show.html.erb"
    response.should have_text(/MyString/)
  end
end

