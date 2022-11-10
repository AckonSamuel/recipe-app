class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'food_id'
  has_many :recipes, through: :recipe_foods
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }
end
