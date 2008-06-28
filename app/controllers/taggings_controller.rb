class TaggingsController < ApplicationController
  def index
    @taggings = Tagging.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taggings }
    end
  end

  def show
    @tagging = Tagging.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tagging }
    end
  end

  def new
    @tagging = Tagging.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tagging }
    end
  end

  def edit
    @tagging = Tagging.find params[:id]
  end

  def create
    @tagging = Tagging.new params[:tagging]

    respond_to do |format|
      if @tagging.save
        flash[:notice] = 'Tagging was successfully created.'
        format.html { redirect_to @tagging }
        format.xml  { render :xml => @tagging, :status => :created, :location => @tagging }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tagging.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tagging = Tagging.find params[:id]

    respond_to do |format|
      if @tagging.update_attributes params[:tagging]
        flash[:notice] = 'Tagging was successfully updated.'
        format.html { redirect_to @tagging }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tagging.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tagging = Tagging.find params[:id]
    @tagging.destroy

    respond_to do |format|
      format.html { redirect_to taggings_url }
      format.xml  { head :ok }
    end
  end
end
