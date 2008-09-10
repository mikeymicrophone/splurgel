require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notices/edit.html.erb" do
  include NoticesHelper
  
  before(:each) do
    assigns[:notice] = @notice = stub_model(Notice,
      :new_record? => false,
      :target_type => "value for target_type",
      :followed_type => "value for followed_type",
      :secondary_targets => "value for secondary_targets",
      :private => "value for private",
    )
  end

  it "should render edit form" do
    render "/notices/edit.html.erb"
    
    response.should have_tag("form[action=#{notice_path(@notice)}][method=post]") do
      with_tag('input#notice_target_type[name=?]', "notice[target_type]")
      with_tag('input#notice_followed_type[name=?]', "notice[followed_type]")
      with_tag('input#notice_secondary_targets[name=?]', "notice[secondary_targets]")
      with_tag('input#notice_private[name=?]', "notice[private]")
    end
  end
end


