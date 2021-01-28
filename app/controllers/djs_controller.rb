class DjsController < ApplicationController

    def index
        if params[:auction_id]
            @auction = Auction.find params[:auction_id]
            @brasses = @auction.djs
        else
            @djs = Dj.all
        end
    end
  
    def show
      @dj = Dj.find_by(user_id: params[:user_id], id: params[:id])
      @auctions = Auction.all
    end  

    
    
    def new
      redirect_if_not_logged_in
      @dj = Dj.new
      @auctions = Auction.all
    end
    
    def create 
      @dj = Dj.new(dj_params)
      @dj.user = current_user
      if @dj.save
        redirect_to djs_path(@dj.user, @dj)
      else
        @auctions = Auction.all
        render "djs/new" 
      end
    end

  
  
    def set_dj
      @dj = Dj.find_by(id: params[:id])
    end
  
    def dj_params
      params.require(:dj).permit(:title, :auction_id)
    end
  end

  