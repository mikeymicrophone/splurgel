require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggings/new.html.erb" do
  include TaggingsHelper
  
  before(:each) do
    @tagging = mock_model(Tagging)
    @tagging.stub!(:new_record?).and_return(true)
    @tagging.stub!(:tag_id).and_return("1")
    @tagging.stub!(:target_type).and_return("MyString")
    @tagging.stub!(:target_id).and_return("1")
    assigns[:tagging] = @tagging
  end

  it "should render new form" do
    render "/taggings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", taggings_path) do
      with_tag("input#tagging_target_type[name=?]", "tagging[target_type]")
    end
  end
end


