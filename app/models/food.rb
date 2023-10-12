class Food < ApplicationRecord
    belongs_to :user
    # has_many :recipe_foods, foreign_key: "food_id", dependent: :destroy

    validates :name, presence: true, length: { maximum: 250 }
    validates :measurement_unit, presence: true, length: { maximum: 250 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
