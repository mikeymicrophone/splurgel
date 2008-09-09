class MessagesController < ApplicationController
  def index
    @messages = Message.find :all, :conditions => {:recipient_id => current_user_id}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  def show
    @message = Message.find params[:id]
    redirect_to messages_path unless current_user.id == @message.recipient_id || current_user.id == @message.user_id

    if @message.read_on.blank? && current_user.id == @message.recipient_id
      @message.read_on = DateTime.now
      @message.save
      @message = Message.find(@message.id) # otherwise throws error when calling time_ago_in_words @message.read_on
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def new
    @message = Message.new params[:message]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def edit
    @message = Message.find params[:id]
  end

  def create
    @message = Message.new params[:message]

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @message = Message.find params[:id]

    respond_to do |format|
      if @message.update_attributes params[:message]
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to @message }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.xml  { head :ok }
    end
  end
end
