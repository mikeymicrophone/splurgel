class TagsController < ApplicationController
  def index
    @tags = if params[:group_id]
      (@group = Group.find(params[:group_id])).tags
    else
      Tag.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  def show
    @tag = Tag.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  def new
    params[:tag] ||= {}
    @tag = Tag.new params[:tag]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def create
    taggings = []
    params[:tag][:name].split(',').each do |t|
      @tag = Tag.find_or_create_by_name t.strip
      taggings << Tagging.apply_to(params[:tagging][:target_type], params[:tagging][:target_id], @tag.id)    if params[:tagging]
    end

    respond_to do |format|
      if @tag.valid?
        flash[:notice] = 'Tag was successfully created.'
        format.html { render :partial => 'taggings/tagging', :collection => taggings }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tag = Tag.find params[:id]

    respond_to do |format|
      if @tag.update_attributes params[:tag]
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to @tag }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.xml  { head :ok }
    end
  end
end
