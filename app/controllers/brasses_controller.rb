class BrassesController < ApplicationController

    def index
        if params[:auction_id]
            @auction = Auction.find params[:auction_id]
            @brasses = @auction.brasses
        else
            @brasses = Brass.all
        end
    end
  
    def show
      @brass = Brass.find_by(user_id: params[:user_id], id: params[:id])
      @auctions = Auction.all
    end  
    
    def new
      redirect_if_not_logged_in
      @brass = Brass.new
      @auctions = Auction.all
    end
    
    def create 
      @brass = Brass.new(brass_params)
      @brass.user = current_user
      if @brass.save
        redirect_to brasses_path(@brass.user, @brass)
      else
        @auctions = Auction.all
        render "brass/new" 
      end
    end

  
  
    def set_brass
      @brass = Brass.find_by(id: params[:id])
    end
  
    def brass_params
      params.require(:brass).permit(:title, :auction_id)
    end
  end