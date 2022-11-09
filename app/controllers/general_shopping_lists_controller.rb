class GeneralShoppingListsController < ApplicationController
  # GET /general_shopping_lists or /general_shopping_lists.json
  def index
    @general_shopping_lists = GeneralShoppingList.all
  end
end
