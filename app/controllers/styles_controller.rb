class StylesController < ApplicationController
  def index
    @styles = if params[:product_id]
      Product.find(params[:product_id]).styles
    else
      Style.find :all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @styles }
    end
  end

  def show
    @style = Style.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @style }
    end
  end

  def new
    params[:style] ||= {}
    params[:style][:product_id] ||= params[:product_id] if params[:product_id]
    @style = Style.new params[:style]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @style }
    end
  end

  def edit
    @style = Style.find params[:id]
  end

  def create
    @style = Style.new params[:style]

    respond_to do |format|
      if @style.save
        flash[:notice] = 'Style was successfully created.'
        format.html { redirect_to @style }
        format.xml  { render :xml => @style, :status => :created, :location => @style }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @style = Style.find params[:id]

    respond_to do |format|
      if @style.update_attributes params[:style]
        flash[:notice] = 'Style was successfully updated.'
        format.html { redirect_to @style }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @style = Style.find params[:id]
    @style.destroy

    respond_to do |format|
      format.html { redirect_to styles_url }
      format.xml  { head :ok }
    end
  end
end
