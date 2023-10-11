class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
  end

  def new
  end

  def create
  end
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
