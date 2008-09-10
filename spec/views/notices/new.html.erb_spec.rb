require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notices/new.html.erb" do
  include NoticesHelper
  
  before(:each) do
    assigns[:notice] = stub_model(Notice,
      :new_record? => true,
      :target_type => "value for target_type",
      :followed_type => "value for followed_type",
      :secondary_targets => "value for secondary_targets",
      :private => "value for private",
    )
  end

  it "should render new form" do
    render "/notices/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", notices_path) do
      with_tag("input#notice_target_type[name=?]", "notice[target_type]")
      with_tag("input#notice_followed_type[name=?]", "notice[followed_type]")
      with_tag("input#notice_secondary_targets[name=?]", "notice[secondary_targets]")
      with_tag("input#notice_private[name=?]", "notice[private]")
    end
  end
end


