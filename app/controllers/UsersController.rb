class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def save_recipe
        binding.pry
        @recipe = Recipe.find_by(id: params[:recipe_id])
        current_user.saved_recipes << @recipe
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email)
    end
end