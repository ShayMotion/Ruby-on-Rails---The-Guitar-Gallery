class SessionsController < ApplicationController
    
    def index
    end

    def new
        
    end

    def create
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Sorry, please try again"
            redirect_to login_path
    end

    def destroy
        session.clear
        redirect_to root_path
    end


end

end





















    # def create
#         @user = User.find(username: params[:session][:username])

#         if @user && @user.authenticate(params[:session][:password])
#            session[:user_id] = @user.id 
#             render json: @user
#         else
#             render json: {
#                 error: "Invalid Credentials"
#             }
#         end
#     end

#     def get_current_user
        
#     if logged_in?
#         render json: UserSerializer.new(current_user), status: ok
#     else 
#         render json: {
#             error: "No one logged in"
#         }
#         end

#     end

#     def destroy
#         session.clear
#         render json: {
#             notice: "successfully logged out"
#         }, status: :ok
#     end

# end