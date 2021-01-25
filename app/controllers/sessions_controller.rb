class SessionsController < ApplicationController
        #skip_before_action 

    def index
    end

    def new
    end

    def create
        if request.env["omniauth.auth"] # user signed in using third-party
            @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "invalid username or password"
            redirect_to login_path   
            end

            # if @user.nil?
            #     @user = User.new
            #     @user.errors.add(:username, "not found")
            # elsif !@user.authenticate(params[:user][:password])
            #     @user.errors.add(:password, "is incorrect")
            # end

            # if !@user.errors.any?
            #     session[:user_id] = @user.id
            #     redirect_to user_path(@user)
            # else
            #     render "sessions/new"
            # end

        end
    end
    

    def destroy
        session.clear
        redirect_to root_path
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