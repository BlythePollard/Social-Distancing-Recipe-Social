class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @group = Group.find_by(id: params[:group_id])
    end

    def create
        @recipe = Recipe.create(recipe_params)
        @group = Group.find_by(id: params[:recipe][:group_id])
        if @group.recipes << @recipe
            redirect_to group_path(@group.id)
        else 
            #render an error
            redirect_to group_path(@group.id)
        end
    end

    def edit
        @user = current_user
        @group = Group.find_by(id: params[:group_id])
        @recipe = Recipe.find_by(id: params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        @recipe.save
        @group = Group.find_by(id: params[:recipe][:group_id])
        redirect_to group_path(@group.id)
    end

    def destroy
        Recipe.find(params[:id]).destroy
        @group = Group.find_by(id: params[:group_id])
        redirect_to group_path(@group.id)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :link, :user_id)
    end

end