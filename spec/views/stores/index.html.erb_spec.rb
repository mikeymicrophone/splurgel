require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stores/index.html.erb" do
  include StoresHelper
  
  before(:each) do
    store_98 = mock_model(Store)
    store_98.should_receive(:name).and_return("MyString")
    store_98.should_receive(:administrator_id).and_return("1")
    store_98.should_receive(:primary_image_id).and_return("1")
    store_99 = mock_model(Store)
    store_99.should_receive(:name).and_return("MyString")
    store_99.should_receive(:administrator_id).and_return("1")
    store_99.should_receive(:primary_image_id).and_return("1")

    assigns[:stores] = [store_98, store_99]
  end

  it "should render list of stores" do
    render "/stores/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

