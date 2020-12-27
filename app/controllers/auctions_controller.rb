class AuctionsController < ApplicationController
  
def index
 @auctions = Auction.all
end

def show
  @auction = Auction.new
  respond_to do |format|
    format.html {render :show}
    format.json {render json: @auction}
  end
end

def new
  @auction = Auction.new
  @guitars = Guitar.all
end

def create
  @auction = Auction.create(auction_params)
  @guitars = Guitar.all
    if @auction.save
    redirect_to auction_path
    else
      render 'auctions/new'
  end
end

def destroy
  Auction.find_by(id: params[:id]).destroy
  redirect_to user_auctions_path
end

private 

def set_user
  @user = User.find_by(id: params[:user_id])
end

def auction_params
  params.require(:auction).permit(:id, :user_id, :guitar_id, :auction_id, :title, :start_date, :end_date, :location)
    end

end



