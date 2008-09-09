class UsersController < ApplicationController
  
  def show
    @user = User.find params[:id]
  end
  
  def index
    @users = User.all
  end
  
  def home
    
  end
  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new params[:user]
    success = @user && @user.save
    if success && @user.errors.empty?
      @user.uses_phone params[:phone][:number]
      @user.uses_site params[:website][:url]
      @shipping_address = Address.create params[:address].merge('user_id' => @user.id)
      @user.primary_address_id = @shipping_address.id if @shipping_address.valid?
      @image = Image.create params[:image] unless params[:image][:uploaded_data].blank?
      @user.add_primary_photo @image if @image
      @user.save
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    redirect_to @user
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
end
