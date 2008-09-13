class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schedules }
    end
  end

  def show
    @schedule = Schedule.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schedule }
    end
  end

  def new
    opening = Time.new
    opening.change(:hour => 9)
    closing = Time.new
    closing.change(:hour => 18)
    @schedule = Schedule.new :sunday_open => opening, :sunday_close => closing, :monday_open => opening, :monday_close => closing, :tuesday_open => opening, :tuesday_close => closing, :wednesday_open => opening, :wednesday_close => closing, :thursday_open => opening, :thursday_close => closing, :friday_open => opening, :friday_close => closing, :saturday_open => opening, :saturday_close => closing

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schedule }
    end
  end

  def edit
    @schedule = Schedule.find params[:id]
  end

  def create
    @schedule = Schedule.new params[:schedule]

    respond_to do |format|
      if @schedule.save
        flash[:notice] = 'Schedule was successfully created.'
        format.html { redirect_to @schedule }
        format.xml  { render :xml => @schedule, :status => :created, :location => @schedule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @schedule = Schedule.find params[:id]

    respond_to do |format|
      if @schedule.update_attributes params[:schedule]
        flash[:notice] = 'Schedule was successfully updated.'
        format.html { redirect_to @schedule }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule = Schedule.find params[:id]
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.xml  { head :ok }
    end
  end
end
