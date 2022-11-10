class FoodsController < ApplicationController
  # GET /foods
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    food = current_user.foods.new(food_params)
    # @food.user = current_user

    if food.save
      flash[:notice] = 'Food is successfully created'
      redirect_to foods_path
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to new_food_path
    end
  end

  def general
    @foods = current_user.foods
    current_user.recipes.map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = recipe_food.food
        test = @foods.select { |f| f.name == food.name }[0]
        test.quantity = test.quantity - recipe_food.quantity
      end
    end
    @foods = @foods.select { |f| f.quantity.negative? }
    @foods.each { |f| f.quantity *= -1 }
    @total = 0
    @foods.each do |food|
      @total += (food.price * food.quantity)
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.all.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food was deleted successfully.'
    else
      flash.now[:alert] = 'There was an error deleting the food.'
    end
    redirect_to foods_path
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
