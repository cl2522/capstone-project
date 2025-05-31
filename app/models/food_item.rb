# == Schema Information
#
# Table name: food_items
#
#  id         :bigint           not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  adder_id   :integer
#  fridge_id  :integer
#
class FoodItem < ApplicationRecord

  belongs_to :adder, required: true, class_name: "User", foreign_key: "adder_id"
  belongs_to :fridge, required: true, class_name: "Fridge", foreign_key: "fridge_id"

end
