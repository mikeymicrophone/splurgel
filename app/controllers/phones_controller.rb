class PhonesController < ApplicationController
  def index
    @phones = Phone.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end

  def show
    @phone = Phone.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  def new
    params[:phone] ||= {}
    @phone = Phone.new params[:phone]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone }
    end
  end


  def edit
    @phone = Phone.find params[:id]
  end

  def create
    @phone = Phone.new params[:phone]

    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Phone was successfully created.'
        format.html { redirect_to @phone }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @phone = Phone.find params[:id]

    respond_to do |format|
      if @phone.update_attributes params[:phone]
        flash[:notice] = 'Phone was successfully updated.'
        format.html { redirect_to @phone }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone = Phone.find params[:id]
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to phones_url }
      format.xml  { head :ok }
    end
  end
end
