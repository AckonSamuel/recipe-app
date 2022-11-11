class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def public
    @totals = {}
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
    @public_recipes.each do |p|
      total = 0
      RecipeFood.where(recipe_id: p.id).each do |rf|
        total += rf.quantity * rf.food.price
      end
      @totals[p.name] = total
    end
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Recipe not added' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    respond_to do |format|
      @recipe.recipe_foods.destroy_all
      if @recipe.destroy
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Recipe not deleted' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :public, :preparation_time)
  end
end
