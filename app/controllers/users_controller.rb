class UsersController < ApplicationController
  # before_action :set_user
  # skip_before_action  only: [:new, :create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user.update(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #error message
      render 'users/#{@user.id}/edit'
    end
  end

  def destroy
    @user.destroy
    session.delete :user_id
    @current_user = nil
    redirect_to root_path
  end

  def delete
    @user = User.find(params[:id])
    if current_user?(@user)
      flash[:error] = "Admin users cannot delete themselves."
    else
      @user.destroy
      flash[:success] = "User deleted."
    end

  def auctions 
    @auctions = current_user.auctions
  end

  def guitars 
    @guitars = current_user.guitars
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
end