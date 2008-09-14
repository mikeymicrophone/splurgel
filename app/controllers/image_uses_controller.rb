class ImageUsesController < ApplicationController
  def prioritize
    @image_use = ImageUse.find params[:id]
    @image_use.target.add_primary_photo @image_use.image_id
    render :text => 'prioritized.!' 
  end
  
  def index
    @image_uses = ImageUse.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @image_uses }
    end
  end

  def show
    @image_use = ImageUse.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image_use }
    end
  end

  def new
    params[:image_use] ||= {}
    @image_use = ImageUse.new params[:image_use]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_use }
    end
  end

  def edit
    @image_use = ImageUse.find params[:id]
  end

  def create
    @image_use = ImageUse.new params[:image_use]

    respond_to do |format|
      if @image_use.save
        flash[:notice] = 'ImageUse was successfully created.'
        format.html { redirect_to @image_use }
        format.xml  { render :xml => @image_use, :status => :created, :location => @image_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @image_use = ImageUse.find params[:id]

    respond_to do |format|
      if @image_use.update_attributes params[:image_use]
        flash[:notice] = 'ImageUse was successfully updated.'
        format.html { redirect_to @image_use }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @image_use = ImageUse.find params[:id]
    @image_use.destroy

    respond_to do |format|
      format.html { redirect_to image_uses_url }
      format.xml  { head :ok }
    end
  end
end
