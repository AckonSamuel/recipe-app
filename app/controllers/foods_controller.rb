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
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:notice] = 'Food is successfully created'
      redirect_to foods_path
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to new_food_path
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.all.find(params[:id]).destroy
    redirect_to foods_path
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
