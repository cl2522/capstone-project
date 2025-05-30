class FridgesController < ApplicationController
  def index
    matching_fridges = Fridge.all
    @list_of_fridges = matching_fridges.order({ created_at: :desc })

    render({ template: "fridges/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_fridge = Fridge.where({ id: the_id }).at(0)

    @food_items = FoodItem.where({ fridge_id: @the_fridge.id })

    # @recent_items = @food_items.where("created_at >= ?", 7.days.ago).order(created_at: :desc)
    # @older_items = @food_items.where("created_at < ?", 7.days.ago).order(created_at: :desc)

    render({ template: "fridges/show" })
  end

  def create
    the_fridge = Fridge.new
    the_fridge.name = params.fetch("query_name")

    if the_fridge.valid?
      the_fridge.save
      redirect_to("/fridges/#{the_fridge.id}", { notice: "Fridge created successfully." })
    else
      redirect_to("/fridges", { alert: the_fridge.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fridge = Fridge.where({ id: the_id }).at(0)
    the_fridge.name = params.fetch("query_name")

    if the_fridge.valid?
      the_fridge.save
      redirect_to("/fridges/#{the_fridge.id}", { notice: "Fridge updated successfully." })
    else
      redirect_to("/fridges/#{the_fridge.id}", { alert: the_fridge.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fridge = Fridge.where({ id: the_id }).at(0)
    the_fridge.destroy

    redirect_to("/fridges", { notice: "Fridge deleted successfully." })
  end
end
