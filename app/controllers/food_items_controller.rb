class FoodItemsController < ApplicationController
  def index
    matching_items = FoodItem.all
    @list_of_food_items = matching_items.order({ created_at: :desc })

    render({ template: "food_items/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_items = FoodItem.where({ id: the_id })
    @the_food_item = matching_items.at(0)

    render({ template: "food_items/show" })
  end

  def create
    the_item = FoodItem.new
    the_item.name = params.fetch("query_name")
    the_item.category = params.fetch("query_category")
    the_item.fridge_id = params.fetch("query_fridge_id")
    # the_item.expires_on = params.fetch("query_expires_on")

    if the_item.valid?
      the_item.save
      redirect_to("/fridges/#{the_item.fridge_id}", { notice: "Item added to fridge." })
    else
      redirect_to("/fridges/#{the_item.fridge_id}", { alert: the_item.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_item = FoodItem.where({ id: the_id }).at(0)

    the_item.name = params.fetch("query_name")
    the_item.category = params.fetch("query_category")
    # the_item.expires_on = params.fetch("query_expires_on")
    the_item.fridge_id = params.fetch("query_fridge_id")

    if the_item.valid?
      the_item.save
      redirect_to("/food_items/#{the_item.id}", { notice: "Item updated successfully." })
    else
      redirect_to("/food_items/#{the_item.id}", { alert: the_item.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = FoodItem.where({ id: the_id }).at(0)

    the_item.destroy

    redirect_to("/food_items", { notice: "Item removed successfully." })
  end
end
