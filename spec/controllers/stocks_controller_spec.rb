require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StocksController do

  def mock_stock(stubs={})
    @mock_stock ||= mock_model(Stock, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all stocks as @stocks" do
      Stock.should_receive(:find).with(:all).and_return([mock_stock])
      get :index
      assigns[:stocks].should == [mock_stock]
    end

    describe "with mime type of xml" do
  
      it "should render all stocks as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Stock.should_receive(:find).with(:all).and_return(stocks = mock("Array of Stocks"))
        stocks.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested stock as @stock" do
      Stock.should_receive(:find).with("37").and_return(mock_stock)
      get :show, :id => "37"
      assigns[:stock].should equal(mock_stock)
    end
    
    describe "with mime type of xml" do

      it "should render the requested stock as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Stock.should_receive(:find).with("37").and_return(mock_stock)
        mock_stock.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new stock as @stock" do
      Stock.should_receive(:new).and_return(mock_stock)
      get :new
      assigns[:stock].should equal(mock_stock)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested stock as @stock" do
      Stock.should_receive(:find).with("37").and_return(mock_stock)
      get :edit, :id => "37"
      assigns[:stock].should equal(mock_stock)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created stock as @stock" do
        Stock.should_receive(:new).with({'these' => 'params'}).and_return(mock_stock(:save => true))
        post :create, :stock => {:these => 'params'}
        assigns(:stock).should equal(mock_stock)
      end

      it "should redirect to the created stock" do
        Stock.stub!(:new).and_return(mock_stock(:save => true))
        post :create, :stock => {}
        response.should redirect_to(stock_url(mock_stock))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved stock as @stock" do
        Stock.stub!(:new).with({'these' => 'params'}).and_return(mock_stock(:save => false))
        post :create, :stock => {:these => 'params'}
        assigns(:stock).should equal(mock_stock)
      end

      it "should re-render the 'new' template" do
        Stock.stub!(:new).and_return(mock_stock(:save => false))
        post :create, :stock => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested stock" do
        Stock.should_receive(:find).with("37").and_return(mock_stock)
        mock_stock.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stock => {:these => 'params'}
      end

      it "should expose the requested stock as @stock" do
        Stock.stub!(:find).and_return(mock_stock(:update_attributes => true))
        put :update, :id => "1"
        assigns(:stock).should equal(mock_stock)
      end

      it "should redirect to the stock" do
        Stock.stub!(:find).and_return(mock_stock(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(stock_url(mock_stock))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested stock" do
        Stock.should_receive(:find).with("37").and_return(mock_stock)
        mock_stock.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stock => {:these => 'params'}
      end

      it "should expose the stock as @stock" do
        Stock.stub!(:find).and_return(mock_stock(:update_attributes => false))
        put :update, :id => "1"
        assigns(:stock).should equal(mock_stock)
      end

      it "should re-render the 'edit' template" do
        Stock.stub!(:find).and_return(mock_stock(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested stock" do
      Stock.should_receive(:find).with("37").and_return(mock_stock)
      mock_stock.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the stocks list" do
      Stock.stub!(:find).and_return(mock_stock(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(stocks_url)
    end

  end

end
