# == Schema Information
#
# Table name: food_items
#
#  id         :bigint           not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fridge_id  :integer
#
class FoodItem < ApplicationRecord


end
