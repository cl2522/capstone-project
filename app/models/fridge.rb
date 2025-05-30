# == Schema Information
#
# Table name: fridges
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Fridge < ApplicationRecord
end
