class WindsController < ApplicationController
    
    def index
        if params[:auction_id]
            @auction = Auction.find params[:auction_id]
            @winds = @auction.winds
        else
            @winds = Wind.all
        end
    end
  
    def show
      @wind = Wind.find_by(user_id: params[:user_id], id: params[:id])
      @auctions = Auction.all
    end  
    
    def new
      redirect_if_not_logged_in
      @wind = Wind.new
      @auctions = Auction.all
    end
    
    def create 
      @wind = Wind.new(wind_params)
      @wind.user = current_user
      if @wind.save
        redirect_to winds_path(@wind.user, @wind)
      else
        @auctions = Auction.all
        render "wind/new" 
      end
    end

  
  
    def set_wind
      @wind = Wind.find_by(id: params[:id])
    end
  
    def wind_params
      params.require(:wind).permit(:title, :auction_id)
    end
  end
