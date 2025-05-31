# == Schema Information
#
# Table name: fridges
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#
class Fridge < ApplicationRecord

  belongs_to :creator, required: true, class_name: "User", foreign_key: "creator_id"
  has_many  :food_items, class_name: "FoodItem", foreign_key: "fridge_id", dependent: :destroy
end
