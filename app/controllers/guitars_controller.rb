class GuitarsController < ApplicationController

  def show
    @guitar = Guitar.find_by(id: params[:id])
  end  
  
  def new
    @guitar = Guitar.new
    @auctions = Auction.all
  end
  
  def create 
    @guitar = Guitar.new(guitar_params)
    @auction = Auction.new(auction_params)
    if @guitar.save
    redirect_to guitars_path(@guitar)
    else
      render "guitars/new" 
  end
end

def index
  @guitar = Guitar.all
  respond_to do |format|
    format.html {render :index}
    format.json {render json: @guitars}
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
  
  def auction_params
    params.require(:auction).permit(:title, :start_date, :end_date)
      end

  def guitar_params
    params.require(:guitar).permit(:brand, :model, :year, :price, auction_attributes:[:title, :start_date, :end_date])
  end
end
