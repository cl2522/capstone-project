class AddCreatorIdToFridges < ActiveRecord::Migration[7.1]
  def change
    add_column :fridges, :creator_id, :integer
  end
end
