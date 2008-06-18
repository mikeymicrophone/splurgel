require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggings/edit.html.erb" do
  include TaggingsHelper
  
  before do
    @tagging = mock_model(Tagging)
    @tagging.stub!(:tag_id).and_return("1")
    @tagging.stub!(:target_type).and_return("MyString")
    @tagging.stub!(:target_id).and_return("1")
    assigns[:tagging] = @tagging
  end

  it "should render edit form" do
    render "/taggings/edit.html.erb"
    
    response.should have_tag("form[action=#{tagging_path(@tagging)}][method=post]") do
      with_tag('input#tagging_target_type[name=?]', "tagging[target_type]")
    end
  end
end


