require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/schedules/edit.html.erb" do
  include SchedulesHelper
  
  before do
    @schedule = mock_model(Schedule)
    @schedule.stub!(:sunday_open).and_return(Time.now)
    @schedule.stub!(:sunday_close).and_return(Time.now)
    @schedule.stub!(:monday_open).and_return(Time.now)
    @schedule.stub!(:monday_close).and_return(Time.now)
    @schedule.stub!(:tuesday_open).and_return(Time.now)
    @schedule.stub!(:tuesday_close).and_return(Time.now)
    @schedule.stub!(:wednesday_open).and_return(Time.now)
    @schedule.stub!(:wednesday_close).and_return(Time.now)
    @schedule.stub!(:thursday_open).and_return(Time.now)
    @schedule.stub!(:thursday_close).and_return(Time.now)
    @schedule.stub!(:friday_open).and_return(Time.now)
    @schedule.stub!(:friday_close).and_return(Time.now)
    @schedule.stub!(:saturday_open).and_return(Time.now)
    @schedule.stub!(:saturday_close).and_return(Time.now)
    @schedule.stub!(:holidays).and_return(false)
    assigns[:schedule] = @schedule
  end

  it "should render edit form" do
    render "/schedules/edit.html.erb"
    
    response.should have_tag("form[action=#{schedule_path(@schedule)}][method=post]") do
      with_tag('input#schedule_holidays[name=?]', "schedule[holidays]")
    end
  end
end


