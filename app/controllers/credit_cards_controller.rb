class CreditCardsController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @credit_cards }
    end
  end

  def show
    @credit_card = CreditCard.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @credit_card }
    end
  end

  def new
    params[:credit_card] ||= {}
    @credit_card = CreditCard.new params[:credit_card]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @credit_card }
    end
  end

  def edit
    @credit_card = CreditCard.find params[:id]
  end

  def create
    @credit_card = CreditCard.new params[:credit_card]

    respond_to do |format|
      if @credit_card.save
        flash[:notice] = 'CreditCard was successfully created.'
        format.html { redirect_to @credit_card }
        format.xml  { render :xml => @credit_card, :status => :created, :location => @credit_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @credit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @credit_card = CreditCard.find params[:id]

    respond_to do |format|
      if @credit_card.update_attributes params[:credit_card]
        flash[:notice] = 'CreditCard was successfully updated.'
        format.html { redirect_to @credit_card }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @credit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @credit_card = CreditCard.find params[:id]
    @credit_card.destroy

    respond_to do |format|
      format.html { redirect_to credit_cards_url }
      format.xml  { head :ok }
    end
  end
end
