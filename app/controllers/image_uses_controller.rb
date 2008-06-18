class ImageUsesController < ApplicationController
  # GET /image_uses
  # GET /image_uses.xml
  def index
    @image_uses = ImageUse.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @image_uses }
    end
  end

  # GET /image_uses/1
  # GET /image_uses/1.xml
  def show
    @image_use = ImageUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image_use }
    end
  end

  # GET /image_uses/new
  # GET /image_uses/new.xml
  def new
    @image_use = ImageUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_use }
    end
  end

  # GET /image_uses/1/edit
  def edit
    @image_use = ImageUse.find(params[:id])
  end

  # POST /image_uses
  # POST /image_uses.xml
  def create
    @image_use = ImageUse.new(params[:image_use])

    respond_to do |format|
      if @image_use.save
        flash[:notice] = 'ImageUse was successfully created.'
        format.html { redirect_to(@image_use) }
        format.xml  { render :xml => @image_use, :status => :created, :location => @image_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /image_uses/1
  # PUT /image_uses/1.xml
  def update
    @image_use = ImageUse.find(params[:id])

    respond_to do |format|
      if @image_use.update_attributes(params[:image_use])
        flash[:notice] = 'ImageUse was successfully updated.'
        format.html { redirect_to(@image_use) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /image_uses/1
  # DELETE /image_uses/1.xml
  def destroy
    @image_use = ImageUse.find(params[:id])
    @image_use.destroy

    respond_to do |format|
      format.html { redirect_to(image_uses_url) }
      format.xml  { head :ok }
    end
  end
end
