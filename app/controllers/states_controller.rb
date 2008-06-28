class StatesController < ApplicationController
  def index
    @states = State.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
    end
  end

  def show
    @state = State.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @state }
    end
  end

  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @state }
    end
  end

  def edit
    @state = State.find params[:id]
  end

  def create
    @state = State.new params[:state]

    respond_to do |format|
      if @state.save
        flash[:notice] = 'State was successfully created.'
        format.html { redirect_to @state }
        format.xml  { render :xml => @state, :status => :created, :location => @state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @state = State.find params[:id]

    respond_to do |format|
      if @state.update_attributes params[:state]
        flash[:notice] = 'State was successfully updated.'
        format.html { redirect_to @state }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @state = State.find params[:id]
    @state.destroy

    respond_to do |format|
      format.html { redirect_to states_url }
      format.xml  { head :ok }
    end
  end
end
