require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/edit.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blog] = @blog = stub_model(Blog,
      :new_record? => false,
      :name => "value for name",
    )
  end

  it "should render edit form" do
    render "/blogs/edit.html.erb"
    
    response.should have_tag("form[action=#{blog_path(@blog)}][method=post]") do
      with_tag('input#blog_name[name=?]', "blog[name]")
    end
  end
end


