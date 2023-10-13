class GeneralShoppingListController < ApplicationController
  def index
    @list = current_user.generate_shopping_list
    puts @list
  end
end
