require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggings/index.html.erb" do
  include TaggingsHelper
  
  before(:each) do
    tagging_98 = mock_model(Tagging)
    tagging_98.should_receive(:tag_id).and_return("1")
    tagging_98.should_receive(:target_type).and_return("MyString")
    tagging_98.should_receive(:target_id).and_return("1")
    tagging_99 = mock_model(Tagging)
    tagging_99.should_receive(:tag_id).and_return("1")
    tagging_99.should_receive(:target_type).and_return("MyString")
    tagging_99.should_receive(:target_id).and_return("1")

    assigns[:taggings] = [tagging_98, tagging_99]
  end

  it "should render list of taggings" do
    render "/taggings/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

