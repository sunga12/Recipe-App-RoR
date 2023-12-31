class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods || []
  end

  def new
    @food = Food.new
    session[:referer] ||= request.referer
  end

  def create
    user = User.find(params[:user_id])
    food = user.foods.build(food_params)
    if food.save
      redirect_to session.delete(:referer) || user_foods_path(current_user),
                  notice: 'The food was saved successfully!'
    else
      flash[:error] = 'Could not save the food!'
      redirect_to new_user_food_path(current_user)
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to user_foods_path(current_user), notice: 'The food was deleted successfully!'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
