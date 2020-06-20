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

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :link, :user_id)
    end

end