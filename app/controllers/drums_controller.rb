class DrumsController < ApplicationController

    def index
        if params[:auction_id]
            @auction = Auction.find params[:auction_id]
            @drums = @auction.drums
        else
            @drums = Drum.all
        end
    end
  
    def show
      @drum = Drum.find_by(user_id: params[:user_id], id: params[:id])
      @auctions = Auction.all
    end  
    
    def new
      redirect_if_not_logged_in
      @drum = Drum.new
      @auctions = Auction.all
    end
    
    def create 
      @drum = Drum.new(drum_params)
      @drum.user = current_user
      if @drum.save
        redirect_to drum_path(@drum.user, @drum)
      else
        @auctions = Auction.all
        render "drums/new" 
      end
    end

  
  
    def set_drum
      @drum = Drum.find_by(id: params[:id])
    end
  
    def drum_params
      params.require(:drum).permit(:title, :auction_id)
    end
  end

  