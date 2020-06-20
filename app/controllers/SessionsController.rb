class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            flash[:notice] = "Your username and password do not match- please try again." #this showing up when logging in via github if already logged in to github?
            redirect_to '/sessions/new'
        end
    end

    def destroy
        reset_session     
        redirect_to '/' 
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end