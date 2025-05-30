class CreateFoodItems < ActiveRecord::Migration[7.1]
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :category
      t.integer :fridge_id

      t.timestamps
    end
  end
end
