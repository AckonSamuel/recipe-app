class RecipeFoodsController < ApplicationController
    def new
        @recipe = Recipe.find(params[:recipe_id])
        unless @recipe.user == current_user
            flash[:alert] = 'You can only add foods to your own recipes'
            redirect_to recipe_path(@recipe)
        end
        @recipe_food = RecipeFood.new
        @foods = current_user.foods 
    end

    
end
