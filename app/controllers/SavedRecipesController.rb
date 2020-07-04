class SavedRecipesController < ApplicationController

    def new
        @recipe = Recipe.find_by(id: params[:id])
        SavedRecipe.create(title: @recipe.title, description: @recipe.description, link: @recipe.link, user_id: @recipe.user_id)
        flash[:notice] = "Recipe Saved!"
        redirect_to group_path(@recipe.group_id)
    end

    def index
        @saved_recipes = SavedRecipe.all
    end

end