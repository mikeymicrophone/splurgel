require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/schedules/index.html.erb" do
  include SchedulesHelper
  
  before(:each) do
    schedule_98 = mock_model(Schedule)
    schedule_98.should_receive(:sunday_open).and_return(Time.now)
    schedule_98.should_receive(:sunday_close).and_return(Time.now)
    schedule_98.should_receive(:monday_open).and_return(Time.now)
    schedule_98.should_receive(:monday_close).and_return(Time.now)
    schedule_98.should_receive(:tuesday_open).and_return(Time.now)
    schedule_98.should_receive(:tuesday_close).and_return(Time.now)
    schedule_98.should_receive(:wednesday_open).and_return(Time.now)
    schedule_98.should_receive(:wednesday_close).and_return(Time.now)
    schedule_98.should_receive(:thursday_open).and_return(Time.now)
    schedule_98.should_receive(:thursday_close).and_return(Time.now)
    schedule_98.should_receive(:friday_open).and_return(Time.now)
    schedule_98.should_receive(:friday_close).and_return(Time.now)
    schedule_98.should_receive(:saturday_open).and_return(Time.now)
    schedule_98.should_receive(:saturday_close).and_return(Time.now)
    schedule_98.should_receive(:holidays).and_return(false)
    schedule_99 = mock_model(Schedule)
    schedule_99.should_receive(:sunday_open).and_return(Time.now)
    schedule_99.should_receive(:sunday_close).and_return(Time.now)
    schedule_99.should_receive(:monday_open).and_return(Time.now)
    schedule_99.should_receive(:monday_close).and_return(Time.now)
    schedule_99.should_receive(:tuesday_open).and_return(Time.now)
    schedule_99.should_receive(:tuesday_close).and_return(Time.now)
    schedule_99.should_receive(:wednesday_open).and_return(Time.now)
    schedule_99.should_receive(:wednesday_close).and_return(Time.now)
    schedule_99.should_receive(:thursday_open).and_return(Time.now)
    schedule_99.should_receive(:thursday_close).and_return(Time.now)
    schedule_99.should_receive(:friday_open).and_return(Time.now)
    schedule_99.should_receive(:friday_close).and_return(Time.now)
    schedule_99.should_receive(:saturday_open).and_return(Time.now)
    schedule_99.should_receive(:saturday_close).and_return(Time.now)
    schedule_99.should_receive(:holidays).and_return(false)

    assigns[:schedules] = [schedule_98, schedule_99]
  end

  it "should render list of schedules" do
    render "/schedules/index.html.erb"
    response.should have_tag("tr>td", false, 2)
  end
end

