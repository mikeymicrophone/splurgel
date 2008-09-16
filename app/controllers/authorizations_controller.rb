class AuthorizationsController < ApplicationController
  def index
    @authorizations = Authorization.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authorizations }
    end
  end

  def show
    @authorization = Authorization.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  def new
    params[:authorization] ||= {}
    @authorization = Authorization.new params[:authorization]
    if !params[:authorization][:target_type].blank? && params[:authorization][:target_id].blank?
      if params[:authorization][:target_type] == 'Store'
        @authorization_types = Authorization.authorization_types(:store)
      elsif params[:authorization][:target_type] == 'Location'
        @authorization_types = Authorization.authorization_types(:location)
      end
    else
      @authorization_types = Authorization.authorization_types
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  def edit
    @authorization = Authorization.find params[:id]
    redirect_to current_user unless current_user.authorized_to_authorize(@authorization.target)
  end

  def create
    if params[:authorization][:target_type].blank?
      params[:authorization].merge!(params[:store][:id].blank? ? {:target_type => 'Location', :target_id => params[:location][:id]} : {:target_type => 'Store', :target_id => params[:store][:id]})
    else
      if params[:authorization][:target_type] == 'Location' && params[:store] && params[:location]
        params[:authorization][:target_id] ||= params[:store][:id].blank? ? params[:location][:id] : params[:store][:id]
      else
        params[:authorization][:target_id] ||= params[:store][:id]
      end
    end
    @authorization = Authorization.new params[:authorization]
    @target = params[:authorization][:target_type].constantize.send(:find, params[:authorization][:target_id])
    redirect_to current_user unless current_user.authorized_to_authorize @target
    
    respond_to do |format|
      if @authorization.save
        flash[:notice] = 'Authorization was successfully created.'
        format.html { redirect_to @authorization }
        format.xml  { render :xml => @authorization, :status => :created, :location => @authorization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @authorization = Authorization.find params[:id]

    respond_to do |format|
      if @authorization.update_attributes params[:authorization]
        flash[:notice] = 'Authorization was successfully updated.'
        format.html { redirect_to @authorization }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @authorization = Authorization.find params[:id]
    @authorization.destroy

    respond_to do |format|
      format.html { redirect_to authorizations_url }
      format.xml  { head :ok }
    end
  end
end
