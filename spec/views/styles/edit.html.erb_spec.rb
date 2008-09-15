require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/edit.html.erb" do
  include StylesHelper
  
  before(:each) do
    assigns[:style] = @style = stub_model(Style,
      :new_record? => false,
      :size => "value for size",
      :traits => "value for traits",
    )
  end

  it "should render edit form" do
    render "/styles/edit.html.erb"
    
    response.should have_tag("form[action=#{style_path(@style)}][method=post]") do
      with_tag('input#style_size[name=?]', "style[size]")
      with_tag('input#style_traits[name=?]', "style[traits]")
    end
  end
end


