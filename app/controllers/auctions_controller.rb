class AuctionsController < ApplicationController

def index
  if params[:auction_id]
    auction = Auction.find_by_id(params[:auction_id])
    @guitars = auction.guitars.where(user_id: current_user.id)
  else
    @guitars = current_user.guitars
  end
end

def show
  @auction = Auction.find(params[:id])
end

def new
  @auction = Auction.new
end

def create
  @auction = Auction.new(auction_params)
    if @auction.save
    redirect_to user_auctions_path(@user)
    else
      redirect_to new_user_auction_url
  end
end

def destroy
  Auction.find_by(id: params[:id]).destroy
  redirect_to user_auctions_path
end

private 

def auction_params
  params.require(:auction).permit(:title, :start_date, :end_date)
    end

end










  #   before_action :set_auction, only: [:show, :update, :destroy]

#   # GET /users
#   def index

#       if logged_in?

#     @auctions = current_user.auctions

#     render json: AuctionSerializer.new(@auctions)
#   else
#       render json: {
#           error: "You must be logged in to see auctions"
#       }
#   end
# end

#   # GET /users/1
#   def show
#     render json: @auction
#   end

#   # POST /users
#   def create
#     @auction = current_user.auctions.build(auction_params)

#     if @auction.save
#       render json: @auction, status: :created, location: @auction
#     else
#       error_resp = {
#         error: @auction.errors.full_messages.to_sentence
#       }
#       render json: error_resp, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /users/1
#   def update
#   if @auction.update(auction_params)
#     render json: AuctionSerializer.new(@auction), status: :ok
#   else
#     error_resp = {
#       error: @auction.errors.full_messages.to_sentence
#     }
#     render json: error_resp, status: :unprocessable_entity
#   end
# end

#   # DELETE /users/1
#   def destroy
#     if @auction.destroy
#       render json: { data: "Auction successfully destroyed" }, status: :ok
#     else 
#       error_resp = {
#         error: "Auction Not Found and Not Destroyed"
#       }
#       render json: error_resp, status: :unprocessable_entity
#   end
# end


#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_auction
#       @auction = auction.find(params[:id])
#     end

#     # Only allow a trusted parameter "white list" through.
#     def auction_params
#       params.require(:auction).permit(:start_date, :end_date, :name)
#     end
# end
