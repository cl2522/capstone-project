class AddAdderIdToFoodItems < ActiveRecord::Migration[7.1]
  def change
    add_column :food_items, :adder_id, :integer
  end
end
