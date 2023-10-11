class FoodsController < ApplicationController
    def index
        @user = User.find(params[:user_id]) 
        @foods = @user.foods || []
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        if @food.save
            flash[:notice] = "The food was saved successfully!"
            redirect_to user_foods_path(@food.user_id)
        else
            flash.now[:error] = "Could not save the food!"
            render 'new'
        end
    end

    def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to user_foods_path(food.user_id)
    end

    private

    def food_params
        prarams.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
end
