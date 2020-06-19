class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.save
            redirect_to user_group_path(recipe_params[:user_id], recipe_params[:group_id])
        else 
            redirect_to new_user_group_recipe_path(recipe_params[:user_id], recipe_params[:group_id])
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :link, :user_id, :group_id)
    end

end