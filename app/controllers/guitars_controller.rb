class GuitarsController < ApplicationController

  def index
    @guitars = Guitar.all.includes(:auction)
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @guitars}
    end
  end

  def show
    @guitar = Guitar.find_by(user_id: params[:user_id], id: params[:id])
    @auctions = Auction.all
  end  
  
  def new
    redirect_if_not_logged_in
    @guitar = Guitar.new
    @auctions = Auction.all
  end
  
  def create 
    @guitar = Guitar.new(guitar_params)
    @guitar.user = current_user
    if @guitar.save
      redirect_to guitar_path(@guitar.user, @guitar)
    else
      @auctions = Auction.all # for rendering auction list on new page
      render "guitars/new" 
    end
  end


  def destroy
    Guitar.find(params[:id]).destroy
    redirect_to guitars_path
  end

  def edit 
    @guitar = Guitar.find_by(id: params[:id])
  end

  def update 
    @guitar.update(guitar_params)
    if @guitar.save
      redirect_to guitar_path
    else 
      render "guitars/edit"
    end
  end


  def set_guitar
    @guitar = Guitar.find_by(id: params[:id])
  end

  def guitar_params
    params.require(:guitar).permit(:brand, :model, :year, :price, :auction_id)
  end
end
