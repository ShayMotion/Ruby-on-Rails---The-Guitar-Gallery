class GuitarsController < ApplicationController

  def index
    if params[:auction_id] && auction = Auction.find_by_id(params[:auction_id])
    @guitars = auction.guitars
    @guitars = current_user.trainings.where(auction_id: params[:auction_id])
  end

  def show
    @guitar = Guitar.find_by(id: params[:id])
  end


  def new
    @guitar = Guitar.new 
  end

  def create 
    @guitar = Guitar.new(guitar_params)
    if @guitar.save
    redirect_to guitar_path(@guitar)
    else
      render :new 
  end

  def edit 
    @guitar = Guitar.find_by(id: params[:id])
  end

  def update 
    @guitar = Guitar.find_by(id: params[:id])
    if @guitar.update)(guitar_params)
      redirect_to guitar_path(@guitar)
    else 
      render :edit
    end

  end

  private 

  def guitar_params
    params.require(:guitar).permit(:brand, :model, :year, :price, auction_attributes:[:title, :start_date, :end_date])
  end
end

































  #   before_action :set_guitar, only: [:show, :update, :destroy]

#   # GET /guitars
#   def index
#     @guitars = Guitar.all

#     render json: @guitars
#   end

#   # GET /guitars/1
#   def show
#     render json: @guitar
#   end

#   # POST /guitars
#   def create
#     @guitar = Guitar.new(guitar_params)

#     if @guitar.save
#       render json: @guitar, status: :created, location: @guitar
#     else
#       render json: @guitar.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /guitars/1
#   def update
#     if @guitar.update(guitar_params)
#       render json: @guitar
#     else
#       render json: @guitar.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /guitars/1
#   def destroy
#     @guitar.destroy
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_guitar
#       @guitar = Guitar.find(params[:id])
#     end

#     # Only allow a trusted parameter "white list" through.
#     def guitar_params
#       params.require(:guitar).permit(:name, :description)
#     end
# end