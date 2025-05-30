class CreateFridges < ActiveRecord::Migration[7.1]
  def change
    create_table :fridges do |t|
      t.string :name

      t.timestamps
    end
  end
end
