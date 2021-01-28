class CommentsController < ApplicationController

    def index
        if params[:auction_id]
            @auction = Auction.find params[:auction_id]
            @comments = @auction.comments
        else
            @comments = Comment.all
        end
    end
  
    def show
      @comment = Comment.find_by(user_id: params[:user_id], id: params[:id])
      @auctions = Auction.all
    end  
    
    def new
      redirect_if_not_logged_in
      @comment = Comment.new
      @auctions = Auction.all
    end
    
    def create 
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to auction_path(@comment.auction.id)
      else
        @auctions = Auction.all
        redirect_to auction_path(@comment.auction.id)
      end
    end

  
  
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:description, :auction_id)
    end
  end